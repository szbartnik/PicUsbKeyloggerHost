/********************************************************************
 Software License Agreement:

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") for its PIC(R) Microcontroller is intended and
 supplied to you, the Company's customer, for use solely and
 exclusively on Microchip PIC Microcontroller products. The
 software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *******************************************************************/
#include <usb/usb.h>
#include <usb/usb_host_hid.h>
#include "fileio/fileio.h"
#include "driver/fileio/sd_spi.h"
#include "uart1.h"
#include <string.h>

#include <stdint.h>
#include <stdbool.h>
#include <system.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <timer_1ms.h>
// *****************************************************************************
// *****************************************************************************
// Type definitions
// *****************************************************************************
// *****************************************************************************

typedef enum _APP_STATE
{
    DEVICE_NOT_CONNECTED,
    WAITING_FOR_DEVICE,
    DEVICE_CONNECTED, /* Device Enumerated  - Report Descriptor Parsed */
    GET_INPUT_REPORT, /* perform operation on received report */
    INPUT_REPORT_PENDING,
    SEND_OUTPUT_REPORT, /* Not needed in case of mouse */
    OUTPUT_REPORT_PENDING,
    ERROR_REPORTED
} KEYBOARD_STATE;


typedef struct
{
    KEYBOARD_STATE state;
    bool inUse;

    struct
    {
        uint16_t id;
        uint16_t size;
        uint16_t pollRate;
        uint8_t *buffer;

        struct
        {           
            struct
            {
                HID_DATA_DETAILS details;
                HID_USER_DATA_SIZE newData[6];
                HID_USER_DATA_SIZE oldData[6];
            } parsed;
        } normal;

        struct
        {
            struct{
                HID_USER_DATA_SIZE data[8];
                HID_DATA_DETAILS details;
            } parsed;
        } modifier;
    } keys;

    struct
    {
        bool updated;
        
        union
        {
            uint8_t value;
            struct
            {
                uint8_t  numLock       : 1;
                uint8_t  capsLock      : 1;
                uint8_t  scrollLock    : 1;
                uint8_t                : 5;
            } bits;
        } report;
        struct
        {
            HID_DATA_DETAILS details;
        } parsed;
    } leds;
} KEYBOARD;

typedef struct
{
    USB_HID_KEYBOARD_KEYPAD key;
    char unmodified;
    char modified;
} HID_KEY_TRANSLATION_TABLE_ENTRY;

#define MAX_ERROR_COUNTER               (10)

// *****************************************************************************
// *****************************************************************************
// Local Variables
// *****************************************************************************
// *****************************************************************************

static KEYBOARD keyboard;
static const HID_KEY_TRANSLATION_TABLE_ENTRY keyTranslationTable[] = 
{
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_A,                                         'a', 'A' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_B,                                         'b', 'B' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_C,                                         'c', 'C' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_D,                                         'd', 'D' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_E,                                         'e', 'E' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_F,                                         'f', 'F' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_G,                                         'g', 'G' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_H,                                         'h', 'H' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_I,                                         'i', 'I' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_J,                                         'j', 'J' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_K,                                         'k', 'K' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_L,                                         'l', 'L' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_M,                                         'm', 'M' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_N,                                         'n', 'N' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_O,                                         'o', 'O' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_P,                                         'p', 'P' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Q,                                         'q', 'Q' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_R,                                         'r', 'R' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_S,                                         's', 'S' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_T,                                         't', 'T' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_U,                                         'u', 'U' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_V,                                         'v', 'V' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_W,                                         'w', 'W' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_X,                                         'x', 'X' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Y,                                         'y', 'Y' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Z,                                         'z', 'Z' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_1_AND_EXCLAMATION_POINT,                   '1', '!' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_2_AND_AT,                                  '2', '@' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_3_AND_HASH,                                '3', '#' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_4_AND_DOLLAR,                              '4', '$' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_5_AND_PERCENT,                             '5', '%' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_6_AND_CARROT,                              '6', '^' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_7_AND_AMPERSAND,                           '7', '&' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_8_AND_ASTERISK,                            '8', '*' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_9_AND_OPEN_PARENTHESIS,                    '9', '(' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_0_AND_CLOSE_PARENTHESIS,                   '0', ')' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_MINUS_AND_UNDERSCORE,                      '-', '_' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_EQUAL_AND_PLUS,                            '=', '+' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_OPEN_BRACKET_AND_OPEN_CURLY_BRACE,         ']', '}' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CLOSE_BRACKET_AND_CLOSE_CURLY_BRACE,       '[', '{' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_BACK_SLASH_AND_PIPE,                       '\\', '|' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_NON_US_HASH_AND_TILDE,                     '`', '~' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_SEMICOLON_AND_COLON,                       ';', ':' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_APOSTROPHE_AND_QUOTE,                      '\'', '\"' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_GRAVE_ACCENT_AND_TILDE,                    '`', '~' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_COMMA_AND_LESS_THAN,                       ',', '<' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_PERIOD_AND_GREATER_THAN,                   '.', '>' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_FORWARD_SLASH_AND_QUESTION_MARK,           '/', '?' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_SPACEBAR,                                  ' ', ' ' }
};


// *****************************************************************************
// *****************************************************************************
// Local Function Prototypes
// *****************************************************************************
// *****************************************************************************
static void App_ProcessInputReport(void);

// *****************************************************************************
// *****************************************************************************
// Functions
// *****************************************************************************
// *****************************************************************************

/*********************************************************************
* Function: void APP_HostHIDTimerHandler(void);
*
* Overview: Switches over the state machine state to get a new report
*           periodically if the device is idle
*
* PreCondition: None
*
* Input: None
*
* Output: None
*
********************************************************************/
static void APP_HostHIDTimerHandler(void)
{
    if(keyboard.state == DEVICE_CONNECTED)
    {
        keyboard.state = GET_INPUT_REPORT;
    }
}

/*********************************************************************
* Function: void APP_HostHIDKeyboardInitialize(void);
*
* Overview: Initializes the demo code
*
* PreCondition: None
*
* Input: None
*
* Output: None
*
********************************************************************/
void APP_HostHIDKeyboardInitialize()
{
    keyboard.state = DEVICE_NOT_CONNECTED;
    keyboard.inUse = false;
    keyboard.keys.buffer = NULL;
}

/*********************************************************************
* Function: void APP_HostHIDKeyboardTasks(void);
*
* Overview: Keeps the demo running.
*
* PreCondition: The demo should have been initialized via
*   the APP_HostHIDKeyboardInitialize()
*
* Input: None
*
* Output: None
*
********************************************************************/
void Write(const void* buffer, size_t size)
{
    FILEIO_OBJECT file;
    
    if (FILEIO_Open (&file, "TESTFILE.CSV", FILEIO_OPEN_WRITE | FILEIO_OPEN_READ | FILEIO_OPEN_APPEND | FILEIO_OPEN_CREATE) == FILEIO_RESULT_FAILURE)
    {
        return;
    }

    // Write some sample data to the card
    if (FILEIO_Write(buffer, 1, size, &file) != size)
    {
        return;
    }

    // Close the file to save the data
    if (FILEIO_Close (&file) != FILEIO_RESULT_SUCCESS)
    {
        return;
    }
}

void APP_HostHIDKeyboardTasks()
{
    uint8_t error;
    uint8_t count;
    
    if(!USBHostHID_ApiDeviceDetect())
    {
        if(keyboard.state != WAITING_FOR_DEVICE)
        {
            keyboard.state = DEVICE_NOT_CONNECTED;

            keyboard.inUse = false;

            if(keyboard.keys.buffer != NULL)
            {
                free(keyboard.keys.buffer);
                keyboard.keys.buffer = NULL;
            }
        }
    }

    switch(keyboard.state)
    {
        case DEVICE_NOT_CONNECTED:
            //PRINT_ClearScreen();
            //PRINT_String("Attach keyboard\r\n", 17);
            keyboard.state = WAITING_FOR_DEVICE;
            LED_Off(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);
            break;
            
        case WAITING_FOR_DEVICE:
            if(USBHostHID_ApiDeviceDetect()) /* True if report descriptor is parsed with no error */
            {
                //PRINT_ClearScreen();
                SYSTEM_Initialize(SYSTEM_STATE_USB_HOST_HID_KEYBOARD);
                LED_On(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);
                
                keyboard.state = DEVICE_CONNECTED;
                TIMER_RequestTick(&APP_HostHIDTimerHandler, 10);
            }
            break;
            
        case DEVICE_CONNECTED:
            break;

        case GET_INPUT_REPORT:
            if(USBHostHID_ApiGetReport( keyboard.keys.id,
                                        keyboard.keys.normal.parsed.details.interfaceNum,
                                        keyboard.keys.size,
                                        keyboard.keys.buffer
                                      )
              )
            {
                /* Host may be busy/error -- keep trying */
            }
            else
            {
                keyboard.state = INPUT_REPORT_PENDING;
            }
            break;

        case INPUT_REPORT_PENDING:
            if(USBHostHID_ApiTransferIsComplete(&error, &count))
            {
                if(error || (count == 0))
                {
                    keyboard.state = DEVICE_CONNECTED;
                }
                else
                {
                    keyboard.state = DEVICE_CONNECTED;

                    App_ProcessInputReport();
                    if(keyboard.leds.updated == true)
                    {
                        keyboard.state = SEND_OUTPUT_REPORT;
                    }
                }
            }
            break;

        case SEND_OUTPUT_REPORT: /* Will be done while implementing Keyboard */
            if(USBHostHID_ApiSendReport(    keyboard.leds.parsed.details.reportID,
                                            keyboard.leds.parsed.details.interfaceNum,
                                            keyboard.leds.parsed.details.reportLength,
                                            (uint8_t*)&keyboard.leds.report
                                       )
              )
            {
                /* Host may be busy/error -- keep trying */
            }
            else
            {
                keyboard.state = OUTPUT_REPORT_PENDING;
            }
            break;

        case OUTPUT_REPORT_PENDING:
            if(USBHostHID_ApiTransferIsComplete(&error, &count))
            {
                keyboard.leds.updated = false;
                keyboard.state = DEVICE_CONNECTED;
            }
            break;

        case ERROR_REPORTED:
            break;

        default:
            break;

    }
}

/****************************************************************************
  Function:
    BOOL USB_HID_DataCollectionHandler(void)
  Description:
    This function is invoked by HID client , purpose is to collect the
    details extracted from the report descriptor. HID client will store
    information extracted from the report descriptor in data structures.
    Application needs to create object for each report type it needs to
    extract.
    For ex: HID_DATA_DETAILS keyboard.keys.modifier.details;
    HID_DATA_DETAILS is defined in file usb_host_hid_appl_interface.h
    Each member of the structure must be initialized inside this function.
    Application interface layer provides functions :
    USBHostHID_ApiFindBit()
    USBHostHID_ApiFindValue()
    These functions can be used to fill in the details as shown in the demo
    code.

  Precondition:
    None

  Parameters:
    None

  Return Values:
    true    - If the report details are collected successfully.
    false   - If the application does not find the the supported format.

  Remarks:
    This Function name should be entered in the USB configuration tool
    in the field "Parsed Data Collection handler".
    If the application does not define this function , then HID cient
    assumes that Application is aware of report format of the attached
    device.
***************************************************************************/
bool APP_HostHIDKeyboardReportParser(void)
{
    uint8_t NumOfReportItem = 0;
    uint8_t i;
    USB_HID_ITEM_LIST* pitemListPtrs;
    USB_HID_DEVICE_RPT_INFO* pDeviceRptinfo;
    HID_REPORTITEM *reportItem;
    HID_USAGEITEM *hidUsageItem;
    uint8_t usageIndex;
    uint8_t reportIndex;
    bool foundLEDIndicator = false;
    bool foundModifierKey = false;
    bool foundNormalKey = false;

    /* The keyboard is already in use. */
    if(keyboard.inUse == true)
    {
        return false;
    }

    pDeviceRptinfo = USBHostHID_GetCurrentReportInfo(); // Get current Report Info pointer
    pitemListPtrs = USBHostHID_GetItemListPointers();   // Get pointer to list of item pointers

    /* Find Report Item Index for Modifier Keys */
    /* Once report Item is located , extract information from data structures provided by the parser */
    NumOfReportItem = pDeviceRptinfo->reportItems;
    for(i=0;i<NumOfReportItem;i++)
    {
        reportItem = &pitemListPtrs->reportItemList[i];
        if((reportItem->reportType==hidReportInput) && (reportItem->dataModes == HIDData_Variable)&&
           (reportItem->globals.usagePage==USB_HID_USAGE_PAGE_KEYBOARD_KEYPAD))
        {
            /* We now know report item points to modifier keys */
            /* Now make sure usage Min & Max are as per application */
            usageIndex = reportItem->firstUsageItem;
            hidUsageItem = &pitemListPtrs->usageItemList[usageIndex];
            if((hidUsageItem->usageMinimum == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL)
                &&(hidUsageItem->usageMaximum == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_GUI)) //else application cannot suuport
            {
               reportIndex = reportItem->globals.reportIndex;
               keyboard.keys.modifier.parsed.details.reportLength = (pitemListPtrs->reportList[reportIndex].inputBits + 7)/8;
               keyboard.keys.modifier.parsed.details.reportID = (uint8_t)reportItem->globals.reportID;
               keyboard.keys.modifier.parsed.details.bitOffset = (uint8_t)reportItem->startBit;
               keyboard.keys.modifier.parsed.details.bitLength = (uint8_t)reportItem->globals.reportsize;
               keyboard.keys.modifier.parsed.details.count=(uint8_t)reportItem->globals.reportCount;
               keyboard.keys.modifier.parsed.details.interfaceNum= USBHostHID_ApiGetCurrentInterfaceNum();
               foundModifierKey = true;
            }

        }
        else if((reportItem->reportType==hidReportInput) && (reportItem->dataModes == HIDData_Array)&&
           (reportItem->globals.usagePage==USB_HID_USAGE_PAGE_KEYBOARD_KEYPAD))
        {
            /* We now know report item points to modifier keys */
            /* Now make sure usage Min & Max are as per application */
            usageIndex = reportItem->firstUsageItem;
            hidUsageItem = &pitemListPtrs->usageItemList[usageIndex];
           reportIndex = reportItem->globals.reportIndex;
           keyboard.keys.normal.parsed.details.reportLength = (pitemListPtrs->reportList[reportIndex].inputBits + 7)/8;
           keyboard.keys.normal.parsed.details.reportID = (uint8_t)reportItem->globals.reportID;
           keyboard.keys.normal.parsed.details.bitOffset = (uint8_t)reportItem->startBit;
           keyboard.keys.normal.parsed.details.bitLength = (uint8_t)reportItem->globals.reportsize;
           keyboard.keys.normal.parsed.details.count = (uint8_t)reportItem->globals.reportCount;
           keyboard.keys.normal.parsed.details.interfaceNum = USBHostHID_ApiGetCurrentInterfaceNum();
           foundNormalKey = true;
        }
        else if((reportItem->reportType==hidReportOutput) &&
                (reportItem->globals.usagePage==USB_HID_USAGE_PAGE_LEDS))
        {
            usageIndex = reportItem->firstUsageItem;
            hidUsageItem = &pitemListPtrs->usageItemList[usageIndex];

            reportIndex = reportItem->globals.reportIndex;
            keyboard.leds.parsed.details.reportLength = (pitemListPtrs->reportList[reportIndex].outputBits + 7)/8;
            keyboard.leds.parsed.details.reportID = (uint8_t)reportItem->globals.reportID;
            keyboard.leds.parsed.details.bitOffset = (uint8_t)reportItem->startBit;
            keyboard.leds.parsed.details.bitLength = (uint8_t)reportItem->globals.reportsize;
            keyboard.leds.parsed.details.count = (uint8_t)reportItem->globals.reportCount;
            keyboard.leds.parsed.details.interfaceNum = USBHostHID_ApiGetCurrentInterfaceNum();
            foundLEDIndicator = true;
        }
    }

    if(pDeviceRptinfo->reports == 1)
    {
        keyboard.keys.id = 0;
        keyboard.keys.size = keyboard.keys.normal.parsed.details.reportLength;
        keyboard.keys.buffer = (uint8_t*)malloc(keyboard.keys.size);
        keyboard.keys.pollRate = pDeviceRptinfo->reportPollingRate;

        if( (foundNormalKey == true) &&
            (foundModifierKey == true) &&
            (keyboard.keys.buffer != NULL)
        )
        {
            keyboard.inUse = true;
        }
    }

    return(keyboard.inUse);
}

/****************************************************************************
  Function:
    void App_ProcessInputReport(void)

  Description:
    This function processes input report received from HID device.

  Precondition:
    None

  Parameters:
    None

  Return Values:
    None

  Remarks:
    None
***************************************************************************/
static void App_ProcessInputReport(void)
{
    uint8_t  i, j;
    bool heldCharacter = false;
    bool shift = false;

   /* process input report received from device */
    USBHostHID_ApiImportData(   keyboard.keys.buffer,
                                keyboard.keys.size,
                                keyboard.keys.modifier.parsed.data,
                                &keyboard.keys.modifier.parsed.details
                            );
    
    USBHostHID_ApiImportData(   keyboard.keys.buffer,
                                keyboard.keys.size,
                                keyboard.keys.normal.parsed.newData,
                                &keyboard.keys.normal.parsed.details
                            );

    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_SHIFT - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
        shift = true;
    }

    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_SHIFT - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
        shift = true;
    }

    for(i=0; i<keyboard.keys.normal.parsed.details.reportLength ;i++)
    {
        heldCharacter = false;
        
        if(keyboard.keys.normal.parsed.newData[i] != 0)
        {
            for(j=0; j<keyboard.keys.normal.parsed.details.reportLength ;j++)
            {
                if(keyboard.keys.normal.parsed.newData[i] == keyboard.keys.normal.parsed.oldData[j])
                {
                    heldCharacter = true;
                    break;
                }
            }

            if(heldCharacter == true)
            {
                continue;
            }
            
            if(keyboard.keys.normal.parsed.newData[i] == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CAPS_LOCK)
            {
                keyboard.leds.report.bits.capsLock ^= 1;
                keyboard.leds.updated = true;
            }else if(keyboard.keys.normal.parsed.newData[i] == USB_HID_KEYBOARD_KEYPAD_KEYPAD_NUM_LOCK_AND_CLEAR)
            {
                keyboard.leds.report.bits.numLock ^= 1;
                keyboard.leds.updated = true;
            }else
            {
                HID_USER_DATA_SIZE key = keyboard.keys.normal.parsed.newData[i];
               
                if(key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_ESCAPE)
                {
                    LED_Toggle(LED_USB_NOTIFY);
                }
                else if(key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RETURN_ENTER)
                {
                    LED_Toggle(LED_USB_NOTIFY);
                    UART1PutChar('X');
                    Write("\r\n", 2);
                }
                else if( (key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_SHIFT) ||
                         (key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_SHIFT)
                       )
                {
                    shift = true;
                }
                else if( (key == USB_HID_KEYBOARD_KEYPAD_KEYPAD_BACKSPACE) ||
                         (key == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_DELETE)
                       )
                {
                    LED_Toggle(LED_USB_NOTIFY);
                    Write("\b", 1);
                }
                else if( (key >= USB_HID_KEYBOARD_KEYPAD_KEYBOARD_A) &&
                         (key <= USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Z)
                       )
                {
                    uint8_t index;

                    for(index = 0; index < sizeof(keyTranslationTable)/sizeof(HID_KEY_TRANSLATION_TABLE_ENTRY); index++)
                    {
                        if(keyTranslationTable[index].key == key)
                        {
                            if( (keyboard.leds.report.bits.capsLock == 1) || (shift == true) )
                            {
                                LED_Toggle(LED_USB_NOTIFY);
                                Write(&keyTranslationTable[index].modified, 1);
                            }
                            else
                            {
                                LED_Toggle(LED_USB_NOTIFY);
                                Write(&keyTranslationTable[index].unmodified, 1);
                            }
                        }
                    }
                }
                else
                {
                    uint8_t index;

                    for(index = 0; index < sizeof(keyTranslationTable)/sizeof(HID_KEY_TRANSLATION_TABLE_ENTRY); index++)
                    {
                        if(keyTranslationTable[index].key == key)
                        {
                            if( shift == true )
                            {
                                LED_Toggle(LED_USB_NOTIFY);
                                Write(&keyTranslationTable[index].modified, 1);
                            }
                            else
                            {
                                LED_Toggle(LED_USB_NOTIFY);
                                Write(&keyTranslationTable[index].unmodified, 1);
                            }
                        }
                    }
                }
            }
        }
        else
        {
            break;
        }
    }

    memcpy(keyboard.keys.normal.parsed.oldData, keyboard.keys.normal.parsed.newData, sizeof(keyboard.keys.normal.parsed.newData));
    memset(keyboard.keys.normal.parsed.newData, 0x00, sizeof(keyboard.keys.normal.parsed.newData));
}

#include "timer.h"
#include "adc.h"
#include "uart1.h"
#include "fileio/fileio.h"
#include "driver/fileio/sd_spi.h"
#include <string.h>

#include <usb/usb.h>
#include <usb/usb_host_hid.h>

#include <system.h>
#include <app_host_hid_keyboard.h>

// The sdCardMediaParameters structure defines user-implemented functions needed by the SD-SPI fileio driver.
// The driver will call these when necessary.  For the SD-SPI driver, the user must provide
// parameters/functions to define which SPI module to use, Set/Clear the chip select pin,
// get the status of the card detect and write protect pins, and configure the CS, CD, and WP
// pins as inputs/outputs (as appropriate).
// For this demo, these functions are implemented in system.c, since the functionality will change
// depending on which demo board/microcontroller you're using.
// This structure must be maintained as long as the user wishes to access the specified drive.
FILEIO_SD_DRIVE_CONFIG sdCardMediaParameters =
{
    1,                                  // Use SPI module 1
    USER_SdSpiSetCs_1,                  // User-specified function to set/clear the Chip Select pin.
    USER_SdSpiGetCd_1,                  // User-specified function to get the status of the Card Detect pin.
    USER_SdSpiGetWp_1,                  // User-specified function to get the status of the Write Protect pin.
    USER_SdSpiConfigurePins_1           // User-specified function to configure the pins' TRIS bits.
};

// The gSDDrive structure allows the user to specify which set of driver functions should be used by the
// FILEIO library to interface to the drive.
// This structure must be maintained as long as the user wishes to access the specified drive.
const FILEIO_DRIVE_CONFIG gSdDrive =
{
    (FILEIO_DRIVER_IOInitialize)FILEIO_SD_IOInitialize,                      // Function to initialize the I/O pins used by the driver.
    (FILEIO_DRIVER_MediaDetect)FILEIO_SD_MediaDetect,                       // Function to detect that the media is inserted.
    (FILEIO_DRIVER_MediaInitialize)FILEIO_SD_MediaInitialize,               // Function to initialize the media.
    (FILEIO_DRIVER_MediaDeinitialize)FILEIO_SD_MediaDeinitialize,           // Function to de-initialize the media.
    (FILEIO_DRIVER_SectorRead)FILEIO_SD_SectorRead,                         // Function to read a sector from the media.
    (FILEIO_DRIVER_SectorWrite)FILEIO_SD_SectorWrite,                       // Function to write a sector to the media.
    (FILEIO_DRIVER_WriteProtectStateGet)FILEIO_SD_WriteProtectStateGet,     // Function to determine if the media is write-protected.
};

// Declare a state machine for our device
typedef enum
{
    DEMO_STATE_NO_MEDIA = 0,
    DEMO_STATE_MEDIA_DETECTED,
    DEMO_STATE_DRIVE_MOUNTED,
    DEMO_STATE_DONE,
    DEMO_STATE_FAILED
} DEMO_STATE;

/********************************************************************
 * Function:        void main(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        Main program entry point.
 *
 * Note:            None
 *******************************************************************/
MAIN_RETURN main(void)
{   
    SYSTEM_Initialize(SYSTEM_STATE_USB_HOST);

    //Initialize the stack
    USBHostInit(0);

    // Initialize the library
    if (!FILEIO_Initialize())
    {
        while(1);
    }
    
    if (FILEIO_MediaDetect(&gSdDrive, &sdCardMediaParameters) == true)
    {
        if (FILEIO_DriveMount('A', &gSdDrive, &sdCardMediaParameters) == FILEIO_ERROR_NONE)
        {
            APP_HostHIDKeyboardInitialize();
        } else return;
    } else return;
    
    Write("started\r\n", 9);
    
    // #########################################
    // # UART CONFIGURATION 
    // #########################################
    //OSCCON = 0x2200;	 //Use primary, no divide FCY = 10Mhz/2 = 5Mhz
    //CLKDIV	=	0x0000;	 //do not divide
    
    //Set up I/O Port
    RPINR18bits.U1RXR = 5; // UART1 RX RP5
    RPOR3bits.RP6R    =	3; // UART1 TX RP6 (function 3)

    // FCY = 8MHz * 4 / 2 = 16MHz
    // BRGx = 16*10^6/(16*19200)-1 = 51
    UART1Init(51);	 //Initiate UART1 to 19200 at 8MHz OSC + PLL
    Delayms(1000);
    
    // #########################################
    
    while(1)
    {
        USBHostTasks();
        USBHostHIDTasks();

        //Application specific tasks
        APP_HostHIDKeyboardTasks();
    }//end while
}//end main



/****************************************************************************
  Function:
    bool USB_ApplicationEventHandler( uint8_t address, USB_EVENT event,
                void *data, uint32_t size )

  Summary:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.

  Description:
    This is the application event handler.  It is called when the stack has
    an event that needs to be handled by the application layer rather than
    by the client driver.  If the application is able to handle the event, it
    returns true.  Otherwise, it returns false.

  Precondition:
    None

  Parameters:
    uint8_t address    - Address of device where event occurred
    USB_EVENT event - Identifies the event that occured
    void *data      - Pointer to event-specific data
    uint32_t size      - Size of the event-specific data

  Return Values:
    true    - The event was handled
    false   - The event was not handled

  Remarks:
    The application may also implement an event handling routine if it
    requires knowledge of events.  To do so, it must implement a routine that
    matches this function signature and define the USB_HOST_APP_EVENT_HANDLER
    macro as the name of that function.
  ***************************************************************************/
bool USB_HOST_APP_EVENT_HANDLER ( uint8_t address, USB_EVENT event, void *data, uint32_t size )
{
    switch( (int)event )
    {
        /* Standard USB host events ******************************************/
        case EVENT_VBUS_REQUEST_POWER:
        case EVENT_VBUS_RELEASE_POWER:
        case EVENT_HUB_ATTACH:
        case EVENT_UNSUPPORTED_DEVICE:
        case EVENT_CANNOT_ENUMERATE:
        case EVENT_CLIENT_INIT_ERROR:
        case EVENT_OUT_OF_MEMORY:
        case EVENT_UNSPECIFIED_ERROR:
            return true;
            break;

        /* HID Class Specific Events ******************************************/
        case EVENT_HID_RPT_DESC_PARSED:
            if(APP_HostHIDKeyboardReportParser() == true)
            {
                return true;
            }
            break;

        default:
            break;
    }

    return false;

}


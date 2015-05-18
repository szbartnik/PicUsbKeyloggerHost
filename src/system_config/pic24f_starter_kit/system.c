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

#include <system.h>

/** CONFIGURATION Bits **********************************************/
_CONFIG1( 
    JTAGEN_OFF & 
    GCP_OFF & 
    GWRP_OFF & 
    FWDTEN_OFF & 
    ICS_PGx2
);

_CONFIG2( 
    PLL_96MHZ_ON & 
    IESO_OFF & 
    FCKSM_CSDCMD & 
    OSCIOFNC_ON & 
    POSCMOD_HS & 
    FNOSC_PRIPLL & 
    PLLDIV_DIV3 & 
    IOL1WAY_ON
);
 
/*********************************************************************
* Function: void SYSTEM_Initialize( SYSTEM_STATE state )
*
* Overview: Initializes the system.
*
* PreCondition: None
*
* Input:  SYSTEM_STATE - the state to initialize the system into
*
* Output: None
*
********************************************************************/
void SYSTEM_Initialize( SYSTEM_STATE state )
{
    switch(state)
    {
        case SYSTEM_STATE_USB_HOST:
            PRINT_SetConfiguration(PRINT_CONFIGURATION_OLED);
            LED_Enable(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);
            break;
            
        case SYSTEM_STATE_USB_HOST_HID_KEYBOARD:
            LED_Enable(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);
            PRINT_SetConfiguration(PRINT_CONFIGURATION_OLED);
            TIMER_SetConfiguration(TIMER_CONFIGURATION_1MS);
            break;
    }
}

void __attribute__((interrupt,auto_psv)) _USB1Interrupt()
{
        USB_HostInterruptHandler();
}
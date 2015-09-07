/*******************************************************************************
 SPI Driver Interface Definition File

  Company:
    Microchip Technology Inc.

  File Name:
    drv_spi.h

  Summary:
    This header file provides APIs for SPI driver. 

  Description:
    This header file provides APIs for SPI driver. 

*******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
*******************************************************************************/
// DOM-IGNORE-END

#ifndef _DRV_SPI_H
#define _DRV_SPI_H

#include <stdint.h>

#ifdef __cplusplus  // Provide C++ Compatability

    extern "C" {

#endif


// *****************************************************************************
/* SPI Modes Enumeration

  Summary:
    Specifies the SPI modes which can be used in the initialization structure
    to initialize the SPI for operation. 
*/

typedef enum
{
    SPI_BUS_MODE_0 = 0x0050,    //smp = 0, ckp = 0
    SPI_BUS_MODE_1,             //smp = 1, ckp = 0
    SPI_BUS_MODE_2,             //smp = 0, ckp = 1
    SPI_BUS_MODE_3,             //smp = 1, ckp = 1
    
}SPI_BUS_MODES;


// *****************************************************************************
/* SPI Initialization structure

  Summary:
    Specifies the members which can be adjusted to allow the
    SPI to be initialized for each instance of SPI.
*/

typedef struct
{
    /*Channel for the SPI communication */
    int    channel;
#if defined (__PIC32MX)
    /*Baud rate for the SPI communication */
	int	    baudRate;
	int     dummy;
#elif defined (__XC16__)
    /* Primary and Secondary prescalers control the SPI frequency */
	int     primaryPrescale;
	int     secondaryPrescale;
#elif defined (__XC8__)
    uint8_t divider;
#endif
    /* Clock Edge Selection Bits */
	char    cke;
    /* One of SPI Bus mode as specified SPI_BUS_MODES */
	SPI_BUS_MODES spibus_mode;
    /* Select between 8 and 16 bit communication */
	char    mode;
	
} DRV_SPI_INIT_DATA;

/* SPI SFR definitions. i represents the SPI
   channel number.
   valid i values are: 1, 2, 3
   for PIC24/32 device families
*/
    #define DRV_SPI_STAT(i)      SPI##i##STAT
    #define DRV_SPI_STATbits(i)  SPI##i##STATbits
    #define DRV_SPI_CON(i)       SPI##i##CON1
    #define DRV_SPI_CONbits(i)   SPI##i##CON1bits
    #define DRV_SPI_CON2(i)      SPI##i##CON2
    #define DRV_SPI_CON2bits(i)  SPI##i##CON2bits
    #define DRV_SPI_BUF(i)       SPI##i##BUF
    #define DRV_SPI_BUFbits(i)   SPI##i##BUFbits

/* macros that defines the SPI signal polarities */
    #define SPI_CKE_IDLE_ACT     0        // data change is on active clock to idle clock state
    #define SPI_CKE_ACT_IDLE     1        // data change is on idle clock to active clock state

    #define SPI_CKP_ACT_HIGH     0        // clock active state is high level
    #define SPI_CKP_ACT_LOW      1        // clock active state is low level

    #define SPI_SMP_PHASE_MID    0        // master mode data sampled at middle of data output time 
    #define SPI_SMP_PHASE_END    1        // master mode data sampled at end of data output time

    #define SPI_MODE_8BITS       0        // communication mode set at 8-bits
    #define SPI_MODE_16BITS      1        // communication mode set at 16-bits
    #define SPI_MODE_32BITS      2        // communication mode set at 32-bits

    #define SPI_MST_MODE_ENABLE  1        // SPI master mode enabled
    #define SPI_MST_MODE_DISABLE 0        // SPI master mode disabled, use SPI in slave mode

    #define SPI_MODULE_ENABLE    1        // Enable SPI 
    #define SPI_MODULE_DISABLE   0        // Disable SPI 



// *****************************************************************************
/* Function: void DRV_SPI_Initialize (DRV_SPI_INIT_DATA *pData)

  Summary:
    Initializes the SPI instance specified by the channel of the initialization
    structure.

  Description:
    This routine initializes the spi driver instance specified by the channel
    of the initialization structure making it ready for clients to lock and
    use it.

  Precondition:
    None.

  Return:
    None.

  Parameters:
    pData      - SPI initialization structure.

  Example:
    <code>
    uint16_t           myBuffer[MY_BUFFER_SIZE];
    unsigned int       total;
    uint8_t            myChannel = 2;
    DRV_SPI_INIT_DATA  spiInitData = {2, 3, 7, 0, SPI_BUS_MODE_3, 0};

    DRV_SPI_Initialize(&spiInitData);
    DRV_SPI_Lock(myChannel);

    total = 0;
    do
    {
        total  += DRV_SPI_PutBuffer( myChannel, &myBuffer[total], MY_BUFFER_SIZE - total );

        // Do something else...

    } while( total < MY_BUFFER_SIZE );

    </code>

  Remarks:
    This routine must be called before any other SPI routine is called.
    This routine should only be called once during system initialization.
*/

void DRV_SPI_Initialize(DRV_SPI_INIT_DATA *pData);


// *****************************************************************************
/* Function: void DRV_SPI_Deinitialize (uint8_t channel)

  Summary:
    Deinitializes the SPI instance specified by the channel parameter

  Description:
    This routine deinitializes the spi driver instance specified by the channel
    parameter.

  Precondition:
    None.

  Return:
    None.

  Parameters:
    channel      - SPI instance which needs to be deinitialized.

  Example:
    <code>
    uint8_t            myChannel = 2;

    DRV_SPI_Deinitialize(myChannel);
    </code>

  Remarks:
    This routine must be called before any other SPI routine is called.
    This routine should only be called once during system initialization.
*/

void DRV_SPI_Deinitialize (uint8_t channel);


// *****************************************************************************
/* Function:
    void DRV_SPI_Put(uint8_t channel, const uint16_t buffer )

  Summary:
    Writes a byte/word of data to the SPI to the specified channel

  Description:
    This routine writes a byte/word of data to the SPI to the specified channel

  Precondition:
    The DRV_SPI_Initialize routine must have been called for the specified
    SPI driver instance.

  Returns:
    None.

  Parameters:
    channel      - SPI instance through which the communication needs to happen

    buffer      - Data byte/word to write to the SPI

  Example:
    <code>
    uint16_t        myBuffer[MY_BUFFER_SIZE];
    unsigned int    numBytes;
    uint8_t         myChannel = 2;

    // Pre-initialize myBuffer with MY_BUFFER_SIZE bytes of valid data.

    numBytes = 0;
    while( numBytes < MY_BUFFER_SIZE )
    {
        // DRV_SPI_Put API returns data in any case, upto the user to use it
        DRV_SPI_Put( myChannel, myBuffer[numBytes++] );

        // Do something else...
    }
    </code>

  Remarks:
    This is blocking routine.
*/

void DRV_SPI_Put(uint8_t channel, uint8_t data);


// *****************************************************************************
/* Function:
    uint16_t DRV_SPI_Get( uint8_t channel)

  Summary:
    Reads a byte/word of data from SPI from the specified channel

  Description:
    This routine reads a byte/word of data from SPI from the specified channel

  Precondition:
    The DRV_SPI_Initialize routine must have been called for the specified
    SPI driver instance.

  Returns:
    A data byte received by the driver.

  Parameters:
    channel      - SPI instance through which the communication needs to happen

  Example:
    <code>
    char            myBuffer[MY_BUFFER_SIZE];
    unsigned int    numBytes;
    uint8_t         myChannel = 2;

    numBytes = 0;
    do
    {
        myBuffer[numBytes++] = DRV_SPI_Get(myChannel);
        // Do something else...

    } while( numBytes < MY_BUFFER_SIZE);
    </code>

  Remarks:
    This is blocking routine.
*/

uint8_t DRV_SPI_Get(uint8_t channel);


// *****************************************************************************
/* Function:
    bool DRV_SPI_Lock(uint8_t channel)

  Summary:
    Locks the SPI instance specified using the channel parameter

  Description:
    This routine locks the SPI driver instance specified using the channel
    parameter

  Precondition:
    None.

  Return:
    Returns the status of the driver usage.

  Parameters:
    channel      - SPI instance through which the communication needs to happen

  Example:
    Refer to DRV_SPI_Initialize() for an example

  Remarks:
    None.
*/

int DRV_SPI_Lock(uint8_t channel);


// *****************************************************************************
/* Function: void DRV_SPI_Unlock(uint8_t channel)

  Summary:
    Unlocks the SPI instance specified by channel parameter

  Description:
    This routine unlocks the SPI driver instance specified by channel parameter
    making it ready for other clients to lock and use it.

  Precondition:
    None.

  Return:
    None.

  Parameters:
    channel      - SPI instance through which the communication needs to happen

  Example:
    <code>
        uint8_t myChannel = 2;

        DRV_SPI_Unlock(myChannel);
    </code>

  Remarks:
    None.
*/

void DRV_SPI_Unlock(uint8_t channel);


// *****************************************************************************
/* Function:
    void DRV_SPI_PutBuffer( uint8_t channel, const uint16_t *buffer, const unsigned int numbytes )

  Summary:
    Writes a data buffer to SPI

  Description:
    This routine writes a buffered data to SPI.

  Precondition:
    The DRV_SPI_Initialize routine must have been called for the specified
    SPI driver instance.

  Returns:
    Number of bytes actually written to the SPI

  Parameters:
    channel      - SPI instance through which the communication needs to happen

    buffer       - Buffer containing the data write to the SPI instance

    numbytes     - Total number of bytes that to write to the SPI instance
                   (must be equal to or less than the size of the buffer)
  Example:
    Refer to DRV_SPI_Initialize() for an example

  Remarks:
    This is a blocking routine.
*/

void DRV_SPI_PutBuffer (uint8_t channel, uint8_t * data, uint16_t count);


// *****************************************************************************
/* Function:
    unsigned int DRV_SPI_GetBuffer ( uint8_t channel, uint16_t *buffer, unsigned int numbytes )

  Summary:
    Reads a buffered data from SPI

  Description:
    This routine reads a buffered data from the SPI.

  Precondition:
    The DRV_SPI_Initialize routine must have been called.

  Returns:
    Number of bytes actually read from the read buffer.

  Parameters:
    channel      - SPI instance through which the communication needs to happen

    buffer       - Buffer into which the data read from the SPI instance
                   will be placed.

    numbytes     - Total number of bytes that need to be read from the module
                   instance (must be equal to or less than the size of the
                   buffer)


  Example:
    <code>
    uint16_t        myBuffer[MY_BUFFER_SIZE];
    unsigned int    total;
    uint8_t         myChannel = 2;
 
    total = 0;
    do
    {
        total  += DRV_SPI_GetBuffer( myChannel, &myBuffer[total], MY_BUFFER_SIZE - total);

        // Do something else...

    } while( total < MY_BUFFER_SIZE );
    </code>

  Remarks:
    This is blocking routine.
*/

void DRV_SPI_GetBuffer (uint8_t channel, uint8_t * data, uint16_t count);

#ifdef __cplusplus  // Provide C++ Compatibility

    }

#endif

#endif // #ifndef _DRV_SPI_H

/*******************************************************************************
 End of File
*/


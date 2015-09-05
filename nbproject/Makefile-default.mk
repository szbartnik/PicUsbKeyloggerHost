#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=app_host_hid_keyboard.c main.c uart1.c usb_config.c system_config/system.c system_config/adc.c system_config/buttons.c system_config/lcd.c system_config/leds.c system_config/timer_1ms.c sd_card/sd_spi.c sd_card/drv_spi_16bit.c microchip_usb/usb_hal_pic24.c microchip_usb/usb_host.c microchip_usb/usb_host_hid.c microchip_usb/usb_host_hid_parser.c sd_card/fileio.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/app_host_hid_keyboard.o ${OBJECTDIR}/main.o ${OBJECTDIR}/uart1.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/system_config/system.o ${OBJECTDIR}/system_config/adc.o ${OBJECTDIR}/system_config/buttons.o ${OBJECTDIR}/system_config/lcd.o ${OBJECTDIR}/system_config/leds.o ${OBJECTDIR}/system_config/timer_1ms.o ${OBJECTDIR}/sd_card/sd_spi.o ${OBJECTDIR}/sd_card/drv_spi_16bit.o ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o ${OBJECTDIR}/microchip_usb/usb_host.o ${OBJECTDIR}/microchip_usb/usb_host_hid.o ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o ${OBJECTDIR}/sd_card/fileio.o
POSSIBLE_DEPFILES=${OBJECTDIR}/app_host_hid_keyboard.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/uart1.o.d ${OBJECTDIR}/usb_config.o.d ${OBJECTDIR}/system_config/system.o.d ${OBJECTDIR}/system_config/adc.o.d ${OBJECTDIR}/system_config/buttons.o.d ${OBJECTDIR}/system_config/lcd.o.d ${OBJECTDIR}/system_config/leds.o.d ${OBJECTDIR}/system_config/timer_1ms.o.d ${OBJECTDIR}/sd_card/sd_spi.o.d ${OBJECTDIR}/sd_card/drv_spi_16bit.o.d ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d ${OBJECTDIR}/microchip_usb/usb_host.o.d ${OBJECTDIR}/microchip_usb/usb_host_hid.o.d ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d ${OBJECTDIR}/sd_card/fileio.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/app_host_hid_keyboard.o ${OBJECTDIR}/main.o ${OBJECTDIR}/uart1.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/system_config/system.o ${OBJECTDIR}/system_config/adc.o ${OBJECTDIR}/system_config/buttons.o ${OBJECTDIR}/system_config/lcd.o ${OBJECTDIR}/system_config/leds.o ${OBJECTDIR}/system_config/timer_1ms.o ${OBJECTDIR}/sd_card/sd_spi.o ${OBJECTDIR}/sd_card/drv_spi_16bit.o ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o ${OBJECTDIR}/microchip_usb/usb_host.o ${OBJECTDIR}/microchip_usb/usb_host_hid.o ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o ${OBJECTDIR}/sd_card/fileio.o

# Source Files
SOURCEFILES=app_host_hid_keyboard.c main.c uart1.c usb_config.c system_config/system.c system_config/adc.c system_config/buttons.c system_config/lcd.c system_config/leds.c system_config/timer_1ms.c sd_card/sd_spi.c sd_card/drv_spi_16bit.c microchip_usb/usb_hal_pic24.c microchip_usb/usb_host.c microchip_usb/usb_host_hid.c microchip_usb/usb_host_hid_parser.c sd_card/fileio.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/app_host_hid_keyboard.o: app_host_hid_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app_host_hid_keyboard.c  -o ${OBJECTDIR}/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app_host_hid_keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/app_host_hid_keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/uart1.o: uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart1.o.d 
	@${RM} ${OBJECTDIR}/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  uart1.c  -o ${OBJECTDIR}/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/uart1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/usb_config.o: usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/usb_config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/system.o: system_config/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/system.o.d 
	@${RM} ${OBJECTDIR}/system_config/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/system.c  -o ${OBJECTDIR}/system_config/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/adc.o: system_config/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/adc.o.d 
	@${RM} ${OBJECTDIR}/system_config/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/adc.c  -o ${OBJECTDIR}/system_config/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/buttons.o: system_config/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/buttons.o.d 
	@${RM} ${OBJECTDIR}/system_config/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/buttons.c  -o ${OBJECTDIR}/system_config/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/buttons.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/buttons.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/lcd.o: system_config/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/lcd.o.d 
	@${RM} ${OBJECTDIR}/system_config/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/lcd.c  -o ${OBJECTDIR}/system_config/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/lcd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/lcd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/leds.o: system_config/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/leds.o.d 
	@${RM} ${OBJECTDIR}/system_config/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/leds.c  -o ${OBJECTDIR}/system_config/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/leds.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/leds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/timer_1ms.o: system_config/timer_1ms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/system_config/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/timer_1ms.c  -o ${OBJECTDIR}/system_config/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/timer_1ms.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/timer_1ms.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sd_card/sd_spi.o: sd_card/sd_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/sd_card" 
	@${RM} ${OBJECTDIR}/sd_card/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/sd_card/sd_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sd_card/sd_spi.c  -o ${OBJECTDIR}/sd_card/sd_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/sd_card/sd_spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/sd_card/sd_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sd_card/drv_spi_16bit.o: sd_card/drv_spi_16bit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/sd_card" 
	@${RM} ${OBJECTDIR}/sd_card/drv_spi_16bit.o.d 
	@${RM} ${OBJECTDIR}/sd_card/drv_spi_16bit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sd_card/drv_spi_16bit.c  -o ${OBJECTDIR}/sd_card/drv_spi_16bit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/sd_card/drv_spi_16bit.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/sd_card/drv_spi_16bit.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_hal_pic24.o: microchip_usb/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_hal_pic24.c  -o ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_host.o: microchip_usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_host.c  -o ${OBJECTDIR}/microchip_usb/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_host.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_host_hid.o: microchip_usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_host_hid.c  -o ${OBJECTDIR}/microchip_usb/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_host_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_host_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o: microchip_usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sd_card/fileio.o: sd_card/fileio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/sd_card" 
	@${RM} ${OBJECTDIR}/sd_card/fileio.o.d 
	@${RM} ${OBJECTDIR}/sd_card/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sd_card/fileio.c  -o ${OBJECTDIR}/sd_card/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/sd_card/fileio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/sd_card/fileio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/app_host_hid_keyboard.o: app_host_hid_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  app_host_hid_keyboard.c  -o ${OBJECTDIR}/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/app_host_hid_keyboard.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/app_host_hid_keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/uart1.o: uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart1.o.d 
	@${RM} ${OBJECTDIR}/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  uart1.c  -o ${OBJECTDIR}/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/uart1.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/uart1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/usb_config.o: usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/usb_config.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/system.o: system_config/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/system.o.d 
	@${RM} ${OBJECTDIR}/system_config/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/system.c  -o ${OBJECTDIR}/system_config/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/system.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/adc.o: system_config/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/adc.o.d 
	@${RM} ${OBJECTDIR}/system_config/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/adc.c  -o ${OBJECTDIR}/system_config/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/adc.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/buttons.o: system_config/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/buttons.o.d 
	@${RM} ${OBJECTDIR}/system_config/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/buttons.c  -o ${OBJECTDIR}/system_config/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/buttons.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/buttons.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/lcd.o: system_config/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/lcd.o.d 
	@${RM} ${OBJECTDIR}/system_config/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/lcd.c  -o ${OBJECTDIR}/system_config/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/lcd.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/lcd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/leds.o: system_config/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/leds.o.d 
	@${RM} ${OBJECTDIR}/system_config/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/leds.c  -o ${OBJECTDIR}/system_config/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/leds.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/leds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system_config/timer_1ms.o: system_config/timer_1ms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/system_config" 
	@${RM} ${OBJECTDIR}/system_config/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/system_config/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system_config/timer_1ms.c  -o ${OBJECTDIR}/system_config/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system_config/timer_1ms.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/system_config/timer_1ms.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sd_card/sd_spi.o: sd_card/sd_spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/sd_card" 
	@${RM} ${OBJECTDIR}/sd_card/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/sd_card/sd_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sd_card/sd_spi.c  -o ${OBJECTDIR}/sd_card/sd_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/sd_card/sd_spi.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/sd_card/sd_spi.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sd_card/drv_spi_16bit.o: sd_card/drv_spi_16bit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/sd_card" 
	@${RM} ${OBJECTDIR}/sd_card/drv_spi_16bit.o.d 
	@${RM} ${OBJECTDIR}/sd_card/drv_spi_16bit.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sd_card/drv_spi_16bit.c  -o ${OBJECTDIR}/sd_card/drv_spi_16bit.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/sd_card/drv_spi_16bit.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/sd_card/drv_spi_16bit.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_hal_pic24.o: microchip_usb/usb_hal_pic24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_hal_pic24.c  -o ${OBJECTDIR}/microchip_usb/usb_hal_pic24.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_hal_pic24.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_host.o: microchip_usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_host.c  -o ${OBJECTDIR}/microchip_usb/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_host.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_host_hid.o: microchip_usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_host_hid.c  -o ${OBJECTDIR}/microchip_usb/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_host_hid.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_host_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o: microchip_usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/microchip_usb" 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  microchip_usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/microchip_usb/usb_host_hid_parser.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/sd_card/fileio.o: sd_card/fileio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/sd_card" 
	@${RM} ${OBJECTDIR}/sd_card/fileio.o.d 
	@${RM} ${OBJECTDIR}/sd_card/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  sd_card/fileio.c  -o ${OBJECTDIR}/sd_card/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/sd_card/fileio.o.d"        -g -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -fno-short-double -O1 -I"microchip_usb" -I"sd_card" -I"system_config" -DPIC24FJ64GB004_PIM -msmart-io=1 -msfr-warn=off -fno-ivopts
	@${FIXDEPS} "${OBJECTDIR}/sd_card/fileio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="map.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -I"microchip_usb" -I"sd_card" -I"system_config" -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="map.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Keylogger-host.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

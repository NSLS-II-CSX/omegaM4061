TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = omegaM4061
# omegaM4061.dbd will be created and installed
DBD += omegaM4061.dbd

# omegaM4061.dbd will be made up from these files:
omegaM4061_DBD += base.dbd

# Include dbd files from all support applications:
omegaM4061_DBD += caPutLog.dbd
omegaM4061_DBD += asyn.dbd
omegaM4061_DBD += stream.dbd
omegaM4061_DBD += drvAsynIPPort.dbd
omegaM4061_DBD += system.dbd
omegaM4061_DBD += asSupport.dbd
omegaM4061_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
omegaM4061_LIBS += caPutLog
omegaM4061_LIBS += stream
omegaM4061_LIBS += asyn
omegaM4061_LIBS += devIocStats
omegaM4061_LIBS += autosave

# omegaM4061_registerRecordDeviceDriver.cpp derives from omegaM4061.dbd
omegaM4061_SRCS += omegaM4061_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
omegaM4061_SRCS_DEFAULT += omegaM4061Main.cpp
omegaM4061_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#omegaM4061_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
omegaM4061_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


#!../../bin/linux-x86_64/omegaM4061

## You may have to change omegaM4061 to something else
## everywhere it appears in this file

< envPaths

cd("${TOP}")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST" , "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST"      , "10.23.0.255")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/omegaM4061.dbd",0,0)
omegaM4061_registerRecordDeviceDriver(pdbbase) 

# Do ASYN stuff

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/proto")
# Port 1 on terminal server
drvAsynIPPortConfigure("IP1", "10.23.2.62:4001")
drvAsynIPPortConfigure("IP2", "10.23.2.62:4002")
#asynSetTraceMask("IP1", 0, 0x9)
#asynSetTraceIOMask("IP1", 0, 0x2)
#asynSetTraceMask("IP2", 0, 0x9)
#asynSetTraceIOMask("IP2", 0, 0x2)

## Load record instances
#dbLoadRecords("$(TOP)/db/omegaM4061.db", "Sys=XF:23ID1-ES,Dev={Cryo:He},PREC=3,PORT=IP1,K_FACTOR=1.454,SCAN=.1 second,ADDR=11")
dbLoadRecords("$(TOP)/db/omegaM4061.db", "Sys=XF:23ID1-ES,Dev={FCCD-N2},PREC=3,PORT=IP2,K_FACTOR=1.0,SCAN=.1 second,ADDR=11")

dbLoadRecords("$(TOP)/db/iocAdminSoft.db", "IOC=XF:23ID1-CT{IOC:OmegaM4061}")

iocInit()

dbl > $(TOP)/records.dbl
system("cp $(TOP)/records.dbl /cf-update/xf23id1-ioc3.omegaM4061.dbl")


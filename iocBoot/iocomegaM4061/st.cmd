#!../../bin/linux-x86_64/omegaM4061

## You may have to change omegaM4061 to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST" , "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST"      , "10.23.0.255")

## Register all support components
dbLoadDatabase("../../dbd/omegaM4061.dbd",0,0)
omegaM4061_registerRecordDeviceDriver(pdbbase) 

# Do ASYN stuff

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/proto")
# Port 1 on terminal server
drvAsynIPPortConfigure("IP1", "10.23.2.62:4001")
asynSetTraceMask("IP1", 0, 0x9)
asynSetTraceIOMask("IP1", 0, 0x2)

## Load record instances
dbLoadRecords("$(TOP)/db/omegaM4061.db", "Sys=XF:23ID1-ES,Dev={Cryo:He},PREC=3,PORT=IP1,MAX_FLOW=10,K_FACTOR=1.454,SCAN=10 second,ADDR=11")

iocInit()

dbl > $(TOP)/records.dbl
system("cp $(TOP)/records.dbl /cf-update/xf23id1-ioc2.omegaM4061.dbl")


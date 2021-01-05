#!../../bin/linux-x86_64/omegaM4061

## You may have to change omegaM4061 to something else
## everywhere it appears in this file

< envPaths
< /epics/common/xf23id1-ioc3-netsetup.cmd

cd("${TOP}")


## Register all support components
dbLoadDatabase("$(TOP)/dbd/omegaM4061.dbd",0,0)
omegaM4061_registerRecordDeviceDriver(pdbbase) 

# Do ASYN stuff

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/proto")
# Port 1 on terminal server
drvAsynIPPortConfigure("IP1", "xf23id1-tsrv5.nsls2.bnl.local:4001")
drvAsynIPPortConfigure("IP2", "xf23id1-tsrv5.nsls2.bnl.local:4002")
#asynSetTraceMask("IP1", 0, 0x9)
#asynSetTraceIOMask("IP1", 0, 0x2)
#asynSetTraceMask("IP2", 0, 0x9)
#asynSetTraceIOMask("IP2", 0, 0x2)

## Load record instances
# 2019-08-16, commented these two lines out because device not connected
#dbLoadRecords("$(TOP)/db/omegaM4061.db", "Sys=XF:23ID1-ES,Dev={Cryo:He},PREC=3,PORT=IP1,K_FACTOR=1.454,SCAN=.1 second,ADDR=11")
#dbLoadRecords("$(TOP)/db/liquid_he.db", "Sys=XF:23ID1-ES,Dev={Cryo:He}")

dbLoadRecords("$(TOP)/db/omegaM4061.db", "Sys=XF:23ID1-ES,Dev={FCCD-N2},PREC=3,PORT=IP2,K_FACTOR=1.0,SCAN=.1 second,ADDR=11")
dbLoadRecords("$(TOP)/db/N2_remaining.db", "Sys=XF:23ID1-ES,Dev={FCCD-N2}")

#Autosave and restore
save_restoreSet_Debug(0)
save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

set_savefile_path("$(TOP)/as/save")
set_requestfile_path("$(TOP)")

set_pass0_restoreFile("auto_settings.sav")
set_pass1_restoreFile("auto_settings.sav")


dbLoadRecords("$(TOP)/db/iocAdminSoft.db", "IOC=XF:23ID1-CT{IOC:OmegaM4061}")

iocInit()

dbl > $(TOP)/records.dbl
system("cp $(TOP)/records.dbl /cf-update/xf23id1-ioc3.omegaM4061.dbl")

#must be after iocInit()
create_monitor_set("auto_settings.req", 15,"Sys=XF:23ID1-ES,Dev={FCCD-N2}")



#!../../bin/linux-x86_64/omegaM4061

## You may have to change omegaM4061 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/omegaM4061.dbd",0,0)
omegaM4061_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/omegaM4061.db","user=swilkins")

iocInit()

## Start any sequence programs
#seq sncomegaM4061,"user=swilkins"

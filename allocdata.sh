#!/bin/bash
dataPath=PATH_TO_DATA
dataDir=/gscratch/uwb/NETID/dataloader/dataDir
execDir=/gscratch/uwb/NETID/dataloader/bin
ext=EXT
dataSize=DATA_SIZE

find -type l -name "[^.]*" -delete
$execDir/dataalloc $dataPath $ext $dataSize

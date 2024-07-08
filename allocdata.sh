#!/bin/bash
dataPath=PATH_TO_DATA
dataDir=/gscratch/uwb/NETID/dataloader/dataDir
execDir=/gscratch/uwb/NETID/dataloader/bin
ext=EXT
dataSize=DATA_SIZE

rm $dataDir/*$ext
$execDir/dataalloc $dataPath $ext $dataSize

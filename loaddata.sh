#!/bin/bash
dataPath=PATH_TO_DATA
dataDir=/gscratch/uwb/NETID/dataloader/dataDir
execDir=/gscratch/uwb/NETID/dataloader/bin
ext=EXT
dataSize=DATA_SIZE

$execDir/dataload $dataPath
shuf $dataDir/.data_content > $dataDir/.data_content_shuf
$execDir/dataalloc $dataPath $ext $dataSize

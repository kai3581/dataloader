#!/bin/bash
dataPath=/gscratch/uwb/PATH_TO_DATA
dataDir=/gscratch/uwb/NETID/dataloader/dataDir
ext=EXT
dataSize=DATA_SIZE

dataload $dataPath
shuf $dataDir/.data_content > $dataDir/.data_content_shuf
dataalloc $dataPath $ext $dataSize

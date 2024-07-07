#!/bin/bash
dataPath=/gscratch/uwb/NETID/PATH_TO_DATA
dataDir=/gscratch/uwb/NETID/dataloading/data_dir
ext=.c
dataSize=3
dataTrain=1
dataTest=1
dataValidate=1

dataload $dataPath
shuf $dataDir/.data_content > $dataDir/.data_content_shuf
dataalloc $dataPath $ext $dataSize $dataTrain $dataTest $dataValidate

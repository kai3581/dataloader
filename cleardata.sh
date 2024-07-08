#!/bin/bash
dataDir=/gscratch/uwb/NETID/dataloader/dataDir

rm $dataDir/* 2> /dev/null
rm $dataDir/.data_content $dataDir/.data_content_shuf
touch $dataDir/.data_content $dataDir/.data_content_shuf

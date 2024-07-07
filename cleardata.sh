#!/bin/bash
dataDir=./dataloading/data_dir

rm $dataDir/train/* 2> /dev/null 
rm $dataDir/test/* 2> /dev/null
rm $dataDir/validate/* 2> /dev/null
rm $dataDir/.data_content $dataDir/.data_content_shuf
touch $dataDir/.data_content $dataDir/.data_content_shuf

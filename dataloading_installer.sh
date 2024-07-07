#!/bin/bash

gcc -o dataload dataload.c
gcc -o dataalloc dataalloc.c
chmod +x loaddata.sh
chmod +x cleardata.sh
mkdir -p data_dir/train #create data directory
mkdir -p data_dir/test
mkdir -p data_dir/validate
mkdir lib
touch data_dir/.data_content data_dir/.data_content_shuf
mkdir bin #isolate executables
mv dataload dataalloc loaddata.sh cleardata.sh bin
echo "alias loaddata='/gscratch/uwb/NETID/dataloading/bin/loaddata.sh'" >> ~/.bashrc
echo "alias cleardata='/gscratch/uwb/NETID/dataloading/bin/cleardata.sh'" >> ~/.bashrc
mv dataload.c dataalloc.c dataloading_installer.sh lib

#!/bin/bash

gcc -o dataload dataload.c
gcc -o dataalloc dataalloc.c
chmod +x loaddata.sh
chmod +x cleardata.sh
chmod +x allocdata.sh
mkdir dataDir
mkdir lib #isolate code and reference
mkdir bin #isolate executables
touch dataDir/.data_content dataDir/.data_content_shuf
mv dataload dataalloc loaddata.sh cleardata.sh allocdata.sh bin
echo "alias loaddata='/gscratch/uwb/NETID/dataloader/bin/loaddata.sh'" >> ~/.bashrc
echo "alias cleardata='/gscratch/uwb/NETID/dataloader/bin/cleardata.sh'" >> ~/.bashrc
echo "alias allocdata='/gscratch/uwb/NETID/dataloader/bin/allocdata.sh'" >> ~/.bashrc
mv dataload.c dataalloc.c dataloader_installer.sh lib

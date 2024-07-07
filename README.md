# dataloading info
creates a directory structure dataloading/data_dir/train test validate
with files shuffled from a data source.

written for use on HYAK 3 UW supercomputer in the uwb lab group

# dataloading setup
#from here on, replace all instances of netid with your NetID,

#e.g., for student@uwb.edu, netid=student

#follow these steps after logging onto uw HYAK:

cd /gscratch/uwb/netid

git clone https://github.com/kai3581/dataloading.git 

cd dataloading

#move 'README.md' temporarily so the next command does not affect it

#(or edit back 'NETID' where you want to after)

sed -i 's/NETID/student/g' ./*

chmod +x dataloading_installer.sh

#the PATH_TO_DATA string in loaddata.sh needs to be modified to the location of the data itself

#CT_images/train/images is the image directory for training CT reconstruction

./dataloading_installer.sh

source ~/.bashrc

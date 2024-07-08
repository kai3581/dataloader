# dataloader info
creates a directory structure dataloading/dataDir
with files shuffled from a data source PATH_TO_DATA in the /gscratch/uwb/ lab directory of NETID@klone.hyak.uw.edu

# dataloader setup
#from here on, replace all instances of netid with your NetID, e.g., for student@uwb.edu, netid=student. Each line preceded by '#' is a comment to consider while following these directions to fit your implementation.

#follow these steps (after having logged in with: ssh netid@klone.hyak.uw.edu):

cd /gscratch/uwb/netid

git clone https://github.com/kai3581/dataloader.git 

cd dataloader

#move 'README.md' temporarily so the next command does not affect it (or edit back 'NETID' where you want it after).

sed -i 's/NETID/netid/g' ./*

chmod +x dataloader_installer.sh

#the PATH_TO_DATA string in loaddata.sh needs to be modified to the location of the data itself. The EXT changed to the extension of files you
want to extract, e.g. .png, the DATA_SIZE to the number of files you want from the selected directory.

#/gscratch/uwb/CT_images/train/images is the image directory for training CT reconstruction

./dataloader_installer.sh

source ~/.bashrc

# Note
As the files in the dataDir directory are symbolic, instead of loading the a file from dataDir, f, by using tf.io.read_file(f), you must use
tf.io.read_file(os.path.realpath(f)), for which you must have imported 'os' and 'tensorflow as tf'

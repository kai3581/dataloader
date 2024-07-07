# dataloading
#from here on, replace all instances of netid with your NetID,
#e.g., for student@uwb.edu, netid=student
#follow these steps after logging onto uw HYAK:
cd /gscratch/uwb/netid
git clone https://github.com/kai3581/dataloading.git 
cd dataloading
sed -i 's/NETID/student/g'
chmod +x dataloading.sh
./dataloading.sh

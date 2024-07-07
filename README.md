# dataloading
#replace NETID with your netid, e.g., for student@uwb.edu NETID=student
#follow these steps after logging onto uw HYAK:
cd /gscratch/uwb/NETID
git clone https://github.com/kai3581/dataloading.git 
cd dataloading
find . -type f -exec awk -i inplace -f awknetid.awk {} +
chmod +x dataloading.sh
./dataloading.sh

#include<stdio.h>
#include<dirent.h>
#include<fcntl.h>
#include<unistd.h>

#define DATA_FILE "/gscratch/uwb/NETID/dataloader/dataDir/.data_content"

int main(int argc, char *argv[]){

	DIR *d;
	FILE *f;
	struct dirent *dir;
	d = opendir(argv[1]);
	if (d){
	
		f = fopen(DATA_FILE,"w");
		if (f){

			readdir(d); //empty .
			readdir(d); //empty ..
			fprintf(f,"%s\n",argv[1]); //absolute path of data directory printed to DATA_FILE
			while((dir = readdir(d)) != NULL){
				
				fseek(f,0L,SEEK_END);
				fprintf(f,"%s\n",dir->d_name);
			}
		fclose(f);
		}
	closedir(d);
	}

	return 0;
}

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<linux/limits.h>

// functions to know: shuf fgets() strrchr()
// 			strcmp() strcpy() strcat()
// 			using cp with system() sprintf()
//			linux/limits.h, strrchr(), symlink()
//arguments: absolute path, .ext, number, train, test, validate
#define S PATH_MAX
//dataPath is the path to the data_dir
#define DATA_FILE "/gscratch/uwb/NETID/dataloading/data_dir/.data_content_shuf"
#define DD_PRE "/gscratch/uwb/NETID/dataloading/data_dir/"

int main(int argc, char **argv){

	FILE *f;
	int subdir = -1;
	int subdirsize = 0;
	char subdirs[S];
	char *chptr, *subdirend;

	char buffer1[S];
	char buffer2[S];
	int size;
	f = fopen(DATA_FILE,"r"); //getting shuffled input
	printf("opened file\n");
	for(size = atoi(argv[3]); size != 0; size){ //if more buffers to fill
		if(subdirsize == 0){
			
			printf("selecting subdir\n");
			subdir++; //update subdir
			subdirsize = atoi(argv[subdir + 4]); //input size
			printf("subdirit:%d\n",subdir);
//			printf("subdirbuf:%s\n",subdirs[subdir]);
			strcpy(subdirs, DD_PRE); // absolute prefix to data_dir
			printf("appendpre\n");
			if(subdir == 0)		
				strcat(subdirs, "train/"); //concat end
			else if(subdir == 1)
				strcat(subdirs, "test/"); //concat end
			else	
				strcat(subdirs, "validate/"); //concat end
			
		subdirend = strrchr(subdirs,'\0');
		printf("appendedsubdir\n");
		}
		

		if(fgets(buffer1, S, f)){ //get line to buffer
			chptr = strrchr(buffer1, '\n'); //replace \n delimiter
			*chptr = '\0';
			chptr = strrchr(buffer1, '.'); //get last .ext
			if(chptr){ //find last '.'

				if(strcmp(chptr,argv[2])==0){ //validate .ext

					strcpy(buffer2,argv[1]); //absolute path
	//				printf("filename:%s\n", buffer1);
					strcat(buffer2, buffer1); //copy over filename
					//^^^is source
				
					strcat(subdirs, buffer1); //dest
			//		printf("data:%s\n", buffer2);
	//				printf("linkto:%s\n", subdirs[subdir]);
					symlink(buffer2, subdirs);
					printf("linked dir\n");
					subdirsize--; //decrease subdir request
					size--; //decrease total request
					*subdirend = '\0'; //end mark
					//symlink to files
				}
			}
		}else{
			printf("%d too few '%s' files", size, argv[4]);
			break;
		}
	}

	printf("closed file\n");
	fclose(f); //now copy the right files to the right directories	

	return 0;
}

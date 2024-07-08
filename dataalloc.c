#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<linux/limits.h>

// functions to know: shuf fgets() strrchr()
// 			strcmp() strcpy() strcat()
// 			using cp with system() sprintf()
//			linux/limits.h, strrchr(), symlink()
//arguments: absolute path, .ext, data_size
#define S PATH_MAX
//dataPath is the path to the data_dir
#define DATA_FILE "/gscratch/uwb/NETID/dataloader/dataDir/.data_content_shuf"
#define DD_PRE "/gscratch/uwb/NETID/dataloader/dataDir/"

int main(int argc, char **argv){

	FILE *f;
	char *srcPrefixEnd, *dstPrefixEnd, *extPtr; //end of prefix for src and dst, as well as extension pointer

	char buffer[S]; //filename buffer
	char src[S]; //source buffer
	char dst[S]; //destination buffer
	srcPrefixEnd = stpcpy(src, argv[1]); //source prefix and ptr at end
	dstPrefixEnd = stpcpy(dst, DD_PRE); //destination prefix and ptr at end
	
	int dataSize; //input size variable
	f = fopen(DATA_FILE,"r"); //getting shuffled input from .data_content_shuf
	for(dataSize = atoi(argv[3]); dataSize > 0; dataSize){ //if more files to get

		if(fgets(buffer, S, f)){ //get input line, enter conditional if null not returned by fgets()

			buffer[strcspn(buffer,"\n")]='\0'; //change trailing newline to null terminator
			extPtr = strrchr(buffer, '.'); //get pointer to extension substring
			if(extPtr){ //find last '.' (location of extension substring)

				if(strcmp(extPtr,argv[2])==0){ //validate .ext, if so then load that file
	
					strcat(src, buffer); //append filename to source directory
					//^^^is source
					strcat(dst, buffer); //^^^ to destination directory
					symlink(src, dst); //symlink the files
					dataSize--; //decrease total request
					//revert to prefixes by null terminating them
					*srcPrefixEnd = *dstPrefixEnd = '\0';
				}
			}
		}else{
			printf("%d too few '%s' files", dataSize, argv[2]);
			break;
		}
	}
	
	fclose(f); //now copy the right files to the right directories	
	return 0;
}

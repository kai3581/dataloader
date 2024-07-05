# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/mmfs1/gscratch/uwb/bkphill2/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/mmfs1/gscratch/uwb/bkphill2/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/mmfs1/gscratch/uwb/bkphill2/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/mmfs1/gscratch/uwb/bkphill2/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Use source ~/.bashrc command once this is added to your ~/.bashrc file so the functions are usable

loadimgs(){
	#load a random sampling of data to directory
	#arguments: #files dest
	#change netid directory to your own, create the image_dir in your netid directory with subdirectories train, validate, and test
	#create imgs.txt file for the names of the image files
	#the first line gets 120 random file names to imgs.txt, the next three copy the first 80 to train, next 20 to validate, and final
	#20 to test
	find "/gscratch/uwb/CT_images/train/images" -type f -name "*.png" | sort -R | head -n "120" > "/gscratch/uwb/bodhik/imgs.txt"
sed -n '1,80p' imgs.txt | xargs -I {} cp {} "/gscratch/uwb/bodhik/image_dir/train"
sed -n '81,100p' imgs.txt | xargs -I {} cp {} "/gscratch/uwb/bodhik/image_dir/test"
sed -n '101,120p' imgs.txt | xargs -I {} cp {} "/gscratch/uwb/bodhik/image_dir/validate"
}

#simply clears the train, test, and validate directories of the image_dir directory

clearimgs(){
	rm /gscratch/uwb/bodhik/image_dir/train/* 
	rm /gscratch/uwb/bodhik/image_dir/test/*
	rm /gscratch/uwb/bodhik/image_dir/validate/* 
}

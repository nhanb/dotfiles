#!/usr/bin/env bash

cd ~

arg=$1
len=${#arg}

# Default backup folder if no arg is provided
if [ "$len" -eq 0 ]; then
    arg="nhanb_dotfiles_backup"
    len=${#arg}+1
fi

# Check if folder exists
cd ~
if [ -e $1 ]; then

    # Do stuff to each file
    for file in $arg/.[a-z]*; do

        # Trim to keep file name only
        name=${file:$len}

        # Restore backup files to home dir
        rm -rf ~/$name
        mv -f $file ~/$name
        echo "$file -> ~/$name"
    done

    # Backup folder should now be removed
    rm -rf $arg

else
    echo "$arg doesn't exist!"
fi

#!/bin/bash
set -e
cd "$(dirname "$0")/.."

timestamp=$(date +%Y%m%d%H%M%S) 

for filename in ".agignore" ".gitconfig" ".gitignore" ".tmux.conf"
do
    source=$PWD/config/$filename
    target=~/$filename

    if [ -L $target ]
    then
        # If symlink already exists, delete it.
        echo "${target} is already symlinked. Deleting it."
        rm $target
    elif [ -e $target ]
    then
        # If the path already exists, move it.
        echo "${target} exists already. Moving it to '${target}.${timestamp}'."
        mv $target ${target}.${timestamp}
    fi

    echo "Copying ${target} -> $source"
    cp $source $target
    echo ""
done

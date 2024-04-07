#!/bin/bash
set -e
cd "$(dirname "$0")/.."

source=$PWD/config/.vim
target=~/.vim

if [ -L $target ]
then
    # If symlink already exists, delete it.
    echo "${target} is already symlinked. Deleting it."
    rm $target
elif [ -e $target ]
then
    # If the path already exists, move it.
    echo "${target} exists already. Moving it to '${target}.old'."
    mv $target ${target}.old
fi

echo "Symlinking ${target} -> $source"
ln -s $source $target

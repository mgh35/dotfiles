#!/bin/bash

set -e

cd "$(dirname "$0")"

# Create symlinked dotfiles
for filename in *.symlink
do
    filepath=$(readlink -f $filename)
    symlink_filepath=~/.$(echo $filename | set 's/.symlink$//')
    rm -f $symlink_filepath
    ln -s $filepath $symlink_filepath
done

# Include the custom BASH file
BASH_INCLUDE_COMMAND="source ~/.bashrc.custom"
grep -qxF $BASH_INCLUDE_COMMAND ~/.bashrc || echo $BASH_INCLUDE_COMMAND >> ~/.bashrc

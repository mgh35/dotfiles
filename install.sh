#!/bin/bash

set -e

cd "$(dirname "$0")"

# Create symlinked dotfiles
for filename in *.symlink
do
    filepath=$PWD/$filename
    symlink_filepath=~/.$(echo $filename | sed 's/.symlink$//')
    echo "Setting symlink to dotfile ${symlink_filepath} ($filename)"
    rm -f $symlink_filepath
    ln -s $filepath $symlink_filepath
done

# Include the custom BASH file
BASH_INCLUDE_COMMAND="source ~/.bashrc.custom"
if [ -e ~/.bashrc ]; then (grep -qxF "$BASH_INCLUDE_COMMAND" ~/.bashrc || echo "$BASH_INCLUDE_COMMAND" >> ~/.bashrc); fi
if [ -e ~/.zshrc ]; then (grep -qxF "$BASH_INCLUDE_COMMAND" ~/.zshrc || echo "$BASH_INCLUDE_COMMAND" >> ~/.zshrc); fi

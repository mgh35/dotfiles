#!/bin/bash

set -e

cd "$(dirname "$0")"

# Create symlinked dotfiles
for filename in *.symlink
do
    filepath=$PWD/$filename
    symlink_filepath=~/.$(echo $filename | sed 's/.symlink$//')
    echo "Setting symlink to dotfile ${symlink_filepath} ($filename)"
    if [ -L $symlink_filepath ]
    then
        rm $symlink_filepath
    elif [ -e $symlink_filepath ]
    then
        mv $symlink_filepath ${symlink_filepath}.old
    fi
    ln -s $filepath $symlink_filepath
done

# Include the custom BASH file
BASH_INCLUDE_COMMAND="source ~/.bashrc.custom"
ZSH_INCLUDE_COMMAND="source ~/.zshrc.custom"
if [ -e ~/.bashrc ];
then 
  (grep -qxF "$BASH_INCLUDE_COMMAND" ~/.bashrc || echo "$BASH_INCLUDE_COMMAND" >> ~/.bashrc)
fi
if [ -e ~/.zshrc ]; then
  (grep -qxF "$BASH_INCLUDE_COMMAND" ~/.zshrc || echo "$BASH_INCLUDE_COMMAND" >> ~/.zshrc)
  (grep -qxF "$ZSH_INCLUDE_COMMAND" ~/.zshrc || echo "$ZSH_INCLUDE_COMMAND" >> ~/.zshrc)
fi

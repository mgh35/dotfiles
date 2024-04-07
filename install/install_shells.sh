#!/bin/bash
set -e
cd "$(dirname "$0")/.."

rc_root=$PWD/shell
timestamp=$(date +%Y%m%d%H%M%S) 

if [ -f ~/.bashrc ]
then
    bashrc_backup_name=".bashrc.${timestamp}"
    echo "Moving old .bashrc -> ${bashrc_backup_name}"
    mv ~/.bashrc ~/${bashrc_backup_name}

    echo "Writing new .bashrc"
    cat > ~/.zshrc <<EOF
source $rc_root/common
source $rc_root/prompt
# source $rc_root/init_pyenv
# source $rc_root/init_conda
# source $rc_root/init_nvm
# source $rc_root/init_dotnet
EOF
fi

if [ -f ~/.zshrc ]
then
    zshrc_backup_name=".zshrc.${timestamp}"
    echo "Moving old .zshrc -> ${zshrc_backup_name}"
    mv ~/.zshrc ~/${zshrc_backup_name}

    echo "Writing new .zshrc"
    cat > ~/.zshrc <<EOF
source $rc_root/common
source $rc_root/prompt
# source $rc_root/init_pyenv
# source $rc_root/init_conda
# source $rc_root/init_nvm
# source $rc_root/init_dotnet
source $rc_root/init_zsh_completions
EOF
fi

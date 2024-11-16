#!/bin/bash
set -e
cd "$(dirname "$0")/.."

rc_root=$PWD/shell
timestamp=$(date +%Y%m%d%H%M%S) 

if [ -f ~/.zshrc ]
then
    zshrc_backup_name=".zshrc.${timestamp}"
    echo "Moving old .zshrc -> ${zshrc_backup_name}"
    mv ~/.zshrc ~/${zshrc_backup_name}
fi

echo "Writing new .zshrc"
cat > ~/.zshrc <<EOF
source $rc_root/common
source $rc_root/init_zsh_completions
# source $rc_root/init_pyenv
# source $rc_root/init_conda
# source $rc_root/init_nvm
# source $rc_root/init_dotnet
source $rc_root/prompt
EOF

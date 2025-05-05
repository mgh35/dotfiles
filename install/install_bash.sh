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
fi

echo "Writing new .bashrc"
cat > ~/.bashrc <<EOF
source $rc_root/common
# source $rc_root/init_pyenv
# source $rc_root/init_conda
# source $rc_root/init_nvm
# source $rc_root/init_dotnet
# source $rc_root/init_rust
source $rc_root/init_ocaml
source $rc_root/prompt
EOF

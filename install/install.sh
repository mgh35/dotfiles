#!/bin/bash
set -e
cd "$(dirname "$0")"

./install_basic.sh
./install_bash.sh
./install_zsh.sh
./install_vim.sh

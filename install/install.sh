#!/bin/bash
set -e
cd "$(dirname "$0")"

./install_basic.sh
./install_shells.sh
./install_vim.sh

#!/bin/sh

sudo apt update
sudo apt install git neovim -y
mkdir -p ${HOME}/.config
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
#!/bin/sh

sudo apt update
sudo apt install git nodejs neovim ripgrep alpine-sdk -y
mkdir -p ${HOME}/.config
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
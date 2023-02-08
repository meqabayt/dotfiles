#!/bin/sh

sudo apt update
sudo apt install git neovim -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts
fc-cache -fv
mkdir -p ${HOME}/.config
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
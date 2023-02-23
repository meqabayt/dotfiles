#!/bin/sh

sudo apt update
sudo apt upgrade -y
sudo apt remove neovim
sudo apt install -y git fuse libfuse2

# install latest nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

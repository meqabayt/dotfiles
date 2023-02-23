#!/bin/sh

apt update
apt remove neovim
apt install -y git

# install latest nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage

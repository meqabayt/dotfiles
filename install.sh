#!/bin/sh
sudo apt update
sudo apt upgrade -y
sudo apt remove neovim
sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt install -y git nodejs npm fuse libfuse2 pip software-properties-common
pip install neovim

# install latest nvim
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin

# install plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# link and create needed files&folders
mkdir -p ~/.nvim/plugged/
ln -s init.vim ~/.config/nvim/init.vim 
#!/bin/sh

apk add git nodejs neovim ripgrep alpine-sdk --update
mkdir ${HOME}/.config/nvim
git clone https://github.com/NvChad/NvChad ${HOME}/.config/nvim
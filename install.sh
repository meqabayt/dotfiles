#!/bin/sh

apk add git nodejs neovim ripgrep alpine-sdk --update
mkdir -p /home/${USER}/.config
git clone https://github.com/NvChad/NvChad /home/${USER}/.config/nvim
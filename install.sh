#!/bin/sh

apk add git nodejs neovim ripgrep alpine-sdk --update
mkdir -p /home/nvim/.config
git clone https://github.com/NvChad/NvChad /home/nvim/.config/nvim
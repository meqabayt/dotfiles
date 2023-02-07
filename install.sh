#!/bin/sh

apk add git nodejs neovim ripgrep alpine-sdk --update
mkdir ~/.config
git clone https://github.com/NvChad/NvChad ~/.config/nvim
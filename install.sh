#!/bin/sh

apt add git nodejs neovim ripgrep alpine-sdk --update
mkdir -p ${HOME}/.config
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
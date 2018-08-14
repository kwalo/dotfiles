#!/usr/bin/env bash

read -p "Overwrite .vim and .zsh config? (y/N) " -n 1
if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
    exit 0
fi
rm -fr ~/.vim ~/.zsh
git clone git@github.com:kwalo/zshrc.git ~/.zsh
git clone --recurse-submodules git@github.com:kwalo/vimrc.git ~/.vim
echo 'source ~/.zsh/profile' >> ~/.zshrc
echo ':source ~/.vim/profile' >> ~/.vimrc

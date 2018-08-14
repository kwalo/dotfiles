#!/usr/bin/env bash

cd $(dirname $0)

# Copying dotfiles
dotfiles='
    .tmux.conf
    .gitconfig
'
for dotfile in $dotfiles; do
    echo $dotfile
done
read -p "Do you want to overwrite these files in your home directory? (y/N) " -n 1
echo ""
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    for dotfile in $dotfiles; do
        cp -r $dotfile $HOME
    done
fi

# Installing Python dependencies
cat requirements.txt
read -p "Do you want to install these Python packages? (y/N) " -n 1
echo ""
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    pip3 install -U --user -r requirements.txt
fi

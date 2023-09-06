#!/bin/bash

apt-get -y install wget unzip

mkdir -p ~/bin
wget -O ~/bin/nvim.appimage https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
chmod +x ~/bin/nvim.appimage

cd ~/bin
./nvim.appimage --appimage-extract
#echo "# Neovim alias" >> ~/.zshrc
#echo "alias nvim=\"$HOME/bin/nvim.appimage\"" >> ~/.zshrc
echo "alias nvim=$HOME/bin/squashfs-root/AppRun" >> ~/.bashrc

mkdir -p $HOME/.config

cd ~/.config
git clone https://github.com/krlspj/nvim-config.git nvim
cd nvim
git checkout develop_42
rm -rf .git

echo "going home ^^"
cd $HOME

exec $SHELL


#!/usr/bin/env bash

read -p "Clone oh-my-zsh yeah? (y/n) " answer
if [ $answer == "y" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

echo "Creating symlinks in oh-my-zsh/custom:"
ln -v -s ~/dotfiles/oh-my-zsh-custom/nhanb.zsh-theme ~/.oh-my-zsh/custom/nhanb.zsh-theme
ln -v -s ~/dotfiles/oh-my-zsh-custom/plugins/ ~/.oh-my-zsh/custom/plugins

# For Ubuntu or Debian-based systems only
echo
read -p "Do you want to install zsh and set it as default? (y/n) " answer
if [ $answer == "y" ]; then
    sudo apt-get install zsh
    chsh -s $(which zsh)
fi

echo
read -p "Solarize gnome-terminal (will overwrite current theme)? (y/n) " answer
if [ $answer == "y" ]; then
    git clone --depth=1 git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/nhanb_tmp
    source ~/nhanb_tmp/install.sh
    rm -rf ~/nhanb_tmp
fi

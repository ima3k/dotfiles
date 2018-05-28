#!/bin/bash
echo "‣"

if [ ! -d "$HOME/.config/nvim/init.vim" ];then
    echo "Installing nvim"
    exec sudo pacman -S neovim
    echo "Installing python modules"
    exec sudo pacman -S python2-neovim python-neovim
    echo "Installing VimPlug"
    exec curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ $? -ne 0 ];then
  exit 1
fi

if [ -e "$HOME/.config/nvim/init.vim" ];then
    echo "Linking init.vim"
    exec ln -s config_files/nvim "$HOME/.config/nvim/init.vim"
    echo "Installing nvim plugins"
    exec nvim :PlugInstall
fi

if [ -e "$HOME/.bashrc" ];then
    echo "Linking bashrc"
    exec ln -s config_files/bashrc "$HOME/.bashrc"
fi

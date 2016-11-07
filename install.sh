#!/bin/bash
echo "‣"
if [ ! -d "$HOME/.vim" ];then
    echo "Installing vim"
    exec yaourt vim
fi

if [ ! -e "$HOME/.vim/bundle/Vundle.vim" ];then
    echo "Installing Vundle plugin for vim"
    exec git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -e "$HOME/.vimrc" ];then
    echo "Linking vimrc"
    exec ln -s config_files/vimrc "$HOME/.vimrc"
    echo "Installing vim plugins"
    exec vim :PluginInstall
fi

if [ -e "$HOME/.vimrc" ];then
    echo "Linking vimrc"
    exec ln -s config_files/vimrc "$HOME/.vimrc"
    echo "Installing vim plugins"
    exec vim :PluginInstall
fi

if [ -e "$HOME/.vimrc" ];then
    echo "Linking vimrc"
    exec ln -s config_files/vimrc "$HOME/.vimrc"
    echo "Installing vim plugins"
    exec vim :PluginInstall
fi

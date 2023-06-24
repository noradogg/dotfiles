#!/bin/bash

function create_symbolic_link() {
    dotfiles_path=`cd $(dirname ${0}) && pwd`
    echo -n "~/.$1 already exists. Do you want to replace it? [Y/n]: "
    read ANS
    case $ANS in
        "" | [Yy]* )
            # Replace
            unlink ~/.$1
            ln -s $dotfiles_path/$1 ~/.$1
            echo "~/.$1 was replaced."
            ;;
        * )
            # Do nothing
            echo "~/.$1 is still existing file."
            ;;
    esac
}

function setup_dein_vim() {
    echo -n "Do you want to setup dein.vim? [y/N]: "
    read ANS
    case $ANS in
        [Yy]* )
            # Setup dein
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
            ;;
        * )
            # Do nothing
            ;;
    esac
}


setup_dein_vim
create_symbolic_link zshrc
create_symbolic_link vimrc
create_symbolic_link Xmodmap


#!/bin/bash

function create_symbolic_link() {
    echo -n "~/.$1 already exists. Do you want to replace it? [Y/n]: "
    read ANS
    case $ANS in
        "" | [Yy]* )
            # Replace
            unlink ~/.$1
            ln -s ./$1 ~/.$1
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
            curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
            sh ./installer.sh ~/.cache/dein && rm installer.sh
            ;;
        * )
            # Do nothing
            ;;
    esac
}

create_symbolic_link zshrc
create_symbolic_link vimrc
setup_dein_vim

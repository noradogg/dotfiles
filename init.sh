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

create_symbolic_link zshrc
create_symbolic_link vimrc

#!/bin/bash

set -x

cd ~/

SOURCE_DIR="$( dirname "$0")"
mkdir -p .vim/autoload .vim/bundle
cp $SOURCE_DIR/.skel/autoload/pathogen.vim .vim/autoload

if [ ! -f ~/.vimrc ]; then
	cp $SOURCE_DIR/.skel/.vimrc ~/
fi

if grep 'execute pathogen#infect()' ~/.vimrc; then
    echo "Pathogen already installed"
else
	echo "execute pathogen#infect()" >> ~/.vimrc
fi

cd ~/.vim/bundle
if [ ! -d ~/.vim/bundle/vim-rails ]; then
    git clone git://github.com/tpope/vim-rails.git
fi
if [ ! -d ~/.vim/bundle/vim-bundler ]; then
    git clone git://github.com/tpope/vim-bundler.git
fi
if [ ! -d ~/.vim/bundle/vim-colors-solarized ]; then
    git clone git://github.com/altercation/vim-colors-solarized.git
fi

#!/bin/bash

set -x

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~/

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen
fi

$SOURCE_DIR/prereqs.sh


if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src
    cd ~/
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

if [ ! -d ~/.nodenv ]; then
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    cd ~/.nodenv && src/configure && make -C src
    cd ~/
    git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
fi


if [ ! -e ~/.local_home ]; then
	ln -s $SOURCE_DIR ~/.local_home
	echo ". ~/.local_home/.rc" >> ~/.bashrc
fi

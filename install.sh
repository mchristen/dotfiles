#!/bin/bash

set -x

cd ~/

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen
fi

./prereqs.sh


if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src
    cd ~/
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi


SOURCE_DIR="$( dirname "$0")"

ln -s $SOURCE_DIR ~/.local_home
echo ". ~/.local_home/.rc" >> ~/.bashrc

#!/bin/bash

set -x

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen
fi

sudo apt-get install build-essential

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
cd ~/
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $SOURCE_DIR ~/.local_home
echo ". ~/.local_home/.rc" >> ~/.bashrc

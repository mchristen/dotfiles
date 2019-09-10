#!/bin/bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~/

if [ ! -f ~/.ssh/id_ed25519.pub ]; then
	ssh-keygen -t ed25519
fi

$SOURCE_DIR/prereqs.sh

if [ ! -e ~/.local_home ]; then
	ln -s $SOURCE_DIR ~/.local_home
	. ~/.local_home/.rc
	echo ". ~/.local_home/.rc" >> ~/.bashrc
fi

sudo gem install tmuxinator

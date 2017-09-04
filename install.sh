#!/bin/bash

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

if [ ! -d ~/.pyenv ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

. ~/.local_home/.rc

RUBY_VERSION="2.3.4"
read -p "Which version of ruby do you want to use account wide?($RUBY_VERSION)" choice
if [ "" != "$choice" ]; then
    RUBY_VERSION=$choice
fi


NODE_VERSION="8.1.3"
read -p "Which version of node do you want to use account wide?($NODE_VERSION)" choice
if [ "" != "$choice" ]; then
    NODE_VERSION=$choice
fi


PYTHON_VERSION="3.6.2"
read -p "Which version of python do you want to use account wide?($PYTHON_VERSION)" choice
if [ "" != "$choice" ]; then
    PYTHON_VERSION=$choice
fi

rbenv install --list | grep $RUBY_VERSION
if [ "0" == "$?" ]; then
    rbenv install $RUBY_VERSION
    rbenv global $RUBY_VERSION
else
    echo "Ruby version not found; try updating ruby-install"
fi

nodenv install --list | grep $NODE_VERSION
if [ "0" == "$?" ]; then
    nodenv install $NODE_VERSION
    nodenv global $NODE_VERSION
else
    echo "Node version not found; try updating nodenv"
fi

pyenv install --list | grep $PYTHON_VERSION
if [ "0" == "$?" ]; then
    pyenv install $PYTHON_VERSION
    pyenv global $PYTHON_VERSION
else
    echo "Python version not found; try updating pyenv"
fi

if [ ! -e ~/.local_home ]; then
	ln -s $SOURCE_DIR ~/.local_home
	echo ". ~/.local_home/.rc" >> ~/.bashrc
fi

gem install tmuxinator

#!/bin/bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~/

if [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen
fi

$SOURCE_DIR/prereqs.sh


if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
fi

if [ ! -e ~/.local_home ]; then
	ln -s $SOURCE_DIR ~/.local_home
	. ~/.local_home/.rc
	echo ". ~/.local_home/.rc" >> ~/.bashrc
fi

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add python
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git

asdf install nodejs latest
asdf install ruby latest
asdf install python latest
asdf install golang latest
asdf install deno latest

if [ ! -e ~/.tool-versions ]; then
	echo "direnv system" >> ~/.tool-versions
fi

mkdir -p .local/share/bash_completion.d

if ! grep deno.bash ~/.bashrc ; then
	asdf shell deno latest
	deno completions bash > ~/.local/share/bash_completion.d/deno.bash
	echo "source $HOME/.local/share/bash_completion.d/deno.bash" >> ~/.bashrc
fi
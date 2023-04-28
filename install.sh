#!/bin/bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~/ || exit

if [ ! -f ~/.ssh/id_ed25519.pub ]; then
	ssh-keygen -t ed25519
fi

"$SOURCE_DIR/prereqs.sh"


if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
fi

if [ ! -e ~/.local_home ]; then
	ln -s $SOURCE_DIR ~/.local_home
	. ~/.local_home/.rc
	echo ". ~/.local_home/.rc" >> ~/.bashrc
fi

ASDF_PLUGINS=(awscli aws-vault direnv dotnet-core golang gradle helm java jq kubectl maven minikube nodejs poetry pulumi python ruby skaffold yarn yq)

for plugin in "${ASDF_PLUGINS[@]}"; do
	asdf plugin add "$plugin"
done

mkdir -p .local/share/bash_completion.d
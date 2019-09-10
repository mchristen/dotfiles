#!/bin/bash

sudo apt-get install tmux vim open-vm-tools apt-transport-https ca-certificates curl gnupg2 software-properties-common ruby
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

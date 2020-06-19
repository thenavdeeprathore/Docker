#!/bin/bash
sudo apt-get update
sudo apt-get -y install wget
sudo apt-get -y install curl

# Install Docker Engine (docker-ce) on Ubuntu
# Prerequisites: Ubuntu Bionic 18.04 (LTS) 64-bit version

sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo usermod -aG docker $USER

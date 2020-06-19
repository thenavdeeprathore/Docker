#!/bin/bash
sudo apt-get update
sudo apt-get -y install wget
sudo apt-get -y install curl

# Install Docker Engine (docker-ce) on Ubuntu
# Prerequisites: Ubuntu Bionic 18.04 (LTS) 64-bit version

# Install using the convenience script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# To use Docker as a non-root user, you should now consider adding your user to the “docker” group
sudo usermod -aG docker $USER

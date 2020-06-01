#!/bin/bash

# Uninstall Docker Engine (docker-ce) on Ubuntu

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc
# Uninstall Docker Engine
sudo apt-get purge docker-ce docker-ce-cli containerd.io
# Images, containers, volumes, or customized configuration files on your host are not automatically removed
sudo rm -rf /var/lib/docker

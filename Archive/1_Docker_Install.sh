# Uninstall Docker Engine on Ubuntu::
# -----------------------------------
# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc
# Uninstall Docker Engine
sudo apt-get purge docker-ce docker-ce-cli containerd.io
# Images, containers, volumes, or customized configuration files on your host are not automatically removed
sudo rm -rf /var/lib/docker


# Install Docker Engine on Ubuntu::
# ---------------------------------
# Install using the convenience script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# To use Docker as a non-root user, you should now consider adding your user to the “docker” group
sudo usermod -aG docker navdeep
docker version


# Install Docker Machine::
# ------------------------
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
chmod +x /usr/local/bin/docker-machine
docker-machine version


# Install Docker Compose::
# ------------------------
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

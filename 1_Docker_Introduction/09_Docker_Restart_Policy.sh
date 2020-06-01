# By default, docker containers will not start when they exit or when docker daemon is restarted
# For this, docker provides restart policies

# We can specify the restart policy by using the --restart flag with docker run command
# no                : Do no automatically restart the container (default)
# on-failure        : Restart the container if it exists, which manifests as a non-zero exit code
# unless-stopped    : Restart the container unless it is explicitly stopped or docker itself is stopped or restarted
# always            : Always restart the container if it stops

docker container run -p 8080:80 -d --name webserver nginx
systemctl restart docker
# container stopped

docker container run -p 8080:80 -d --name webserver --restart unless-stopped nginx
systemctl restart docker
# container is still running

# The docker container exec command runs a new command in a running container
# The command started using docker exec only runs while the container's primary process (PID 1) is running, and it is not restarted if the container is restarted.

docker container run --detach --publish 80:80 --name nginx-exec nginx

# bash inside nginx
docker container exec -it nginx-exec bash

/etc/init.d/nginx status
# [ ok ] nginx is running.

# Importance of -it flags, both are mandatory for exec
docker container exec -i -t nginx-exec bash
docker container exec -it nginx-exec bash

# -i / --interactive    :   flag keeps stdin open even if not attached
# -t / --tty            :   flag allocates a pseudo-TTY

# check logs
docker container logs nginx-exec

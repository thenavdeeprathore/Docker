# default COMMAND -- CMD

docker container run -p 8080:80 -d --name webserver nginx

    # navdeep@navdeeplabs:~$ docker ps
    # CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
    # b37d4ad52efb        nginx               "nginx -g 'daemon of…"   4 seconds ago       Up 2 seconds        0.0.0.0:8080->80/tcp   webserver

# Override default COMMAND
docker container run -p 80:80 -d --name myserver nginx sleep 1

    # CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
    # 3ea9aeef21a6        nginx               "sleep 1"           11 seconds ago      Exited (0) 9 seconds ago                       myserver


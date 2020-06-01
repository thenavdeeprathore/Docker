# Three ways to build a docker image

# docker build .
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              cdbf6d352f19        2 minutes ago       155MB

# docker build -t thenavdeeprathore/nginx .
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
thenavdeeprathore/nginx   latest              1a66f1ba77eb        3 seconds ago       155MB

# docker build -t navdeep-nginx:1.18.0 .
REPOSITORY                TAG                 IMAGE ID            CREATED              SIZE
navdeep-nginx             1.18.0              1a66f1ba77eb        About a minute ago   155MB


# Difference between COPY and ADD
COPY takes in a src and destination. It only lets you copy in a local file or a directory from your host.

ADD lets you do that too, but it also supports 2 other sources: 
1) You can use URL instead of a local file / directory
2) You can extract a tar file from the source directly into the destination

NOTE: use curl or wget to fetch packages from remote URLs

# This approach will increase the image size
ADD http://example.com/big.tar.xz /usr/src/things/
RUN tar -xJF /usr/src/things/big.tar.xz -C /usr/src/things
RUN make -C /usr/src/things all

# Instead use this approach
RUN mkdir -p /usr/src/things \
    && curl -SL http://example.com/big.tar.xz \
    | tar -xJC /usr/src/things \
    && make -C /usr/src/things all


# COPY and ADD
FROM busybox
COPY demo.txt /tmp
ADD compress.tar.gz /tmp
CMD ["sh"]


# EXPOSE
# EXPOSE instruction does not actually publish the port
# It informs docker that the container listens on the specified network ports at runtime
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /var/www/html
EXPOSE 90
CMD nginx -g 'daemon off;'


# ENTRYPOINT vs CMD
# The best use for ENTRYPOINT is to set the image's main command
# ENTRYPOINT doesn't allow you to override the command
# ENTRYPOINT configures a container that will run as an executable
# CMD sets default command and/or parameters, which can be overwritten from command line when docker container runs.

# can't overwrite ENTRYPOINT
FROM ubuntu
RUN apt-get update
ENTRYPOINT ["sleep", "5"]
# docker run myos           : CMD           : sleep 5
# docker run myos sleep 2   : CMD           : sleep 2

# can overwrite CMD
FROM ubuntu
RUN apt-get update
CMD ["sleep", "5"]
# docker run myos           : CMD           : sleep 5

FROM ubuntu
RUN apt-get update
ENTRYPOINT ["sleep"]
CMD ["5"]
# docker run myos           : CMD           : sleep 5
# docker run myos 10        : ENTRYPOINT    : sleep 10


# tag
# If the created image doesn't have a TAG name and repository name then we can use tag flag
docker build .
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              cdbf6d352f19        2 minutes ago       155MB


docker tag cdbf6d352f19 demo:v1
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
demo                v1                  cdbf6d352f19        2 minutes ago       155MB


# create alias with the tag -- which will create same IMAGE ID
navdeep@navdeeplabs:~/Desktop/Dockerfiles$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              9beeba249f3e        2 weeks ago         127MB

docker tag nginx webserver:v1

navdeep@navdeeplabs:~/Desktop/Dockerfiles$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              9beeba249f3e        2 weeks ago         127MB
webserver           v1                  9beeba249f3e        2 weeks ago         127MB


# commit
# By default, the container being committed and its processes will be paused while the image is committed
docker container commit busybox mydemo

# --change
docker container commit --change='CMD ["ash"]' busybox

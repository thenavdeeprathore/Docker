docker image history nginx
navdeep@navdeeplabs:~$ docker image history nginx
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
9beeba249f3e        9 days ago          /bin/sh -c #(nop)  CMD ["nginx" "-g" "daemon…   0B
<missing>           9 days ago          /bin/sh -c #(nop)  STOPSIGNAL SIGTERM           0B
<missing>           9 days ago          /bin/sh -c #(nop)  EXPOSE 80                    0B
<missing>           9 days ago          /bin/sh -c ln -sf /dev/stdout /var/log/nginx…   22B
<missing>           9 days ago          /bin/sh -c set -x     && addgroup --system -…   57.6MB
<missing>           9 days ago          /bin/sh -c #(nop)  ENV PKG_RELEASE=1~buster     0B
<missing>           9 days ago          /bin/sh -c #(nop)  ENV NJS_VERSION=0.3.9        0B
<missing>           9 days ago          /bin/sh -c #(nop)  ENV NGINX_VERSION=1.17.10    0B
<missing>           9 days ago          /bin/sh -c #(nop)  LABEL maintainer=NGINX Do…   0B
<missing>           10 days ago         /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>           10 days ago         /bin/sh -c #(nop) ADD file:7780c81c33e6cc5b6…   69.2MB


docker image inspect nginx

# Images are made up of file system changes and metadata
# Each layer is uniquely identified and only stored once on host
# This saves storage space on host and transfer time on push/pull
# A container is just a single read/write layer on top of image

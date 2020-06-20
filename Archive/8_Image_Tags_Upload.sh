# Images doesn't have NAME tab
navdeep@navdeeplabs:~$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              9beeba249f3e        9 days ago          127MB
ubuntu              latest              1d622ef86b13        4 weeks ago         73.9MB

# REPOSITORY is made of either username or oragnization/repository
# Officail docker images will only show repository
# TAG is similar like git commit

# This will replicate Image ID from the existing image
docker image tag nginx thenavdeeprathore/nginx

docker login
  Username: thenavdeeprathore
  Password:
cat .docker/config.json
docker image push thenavdeeprathore/nginx

docker image tag thenavdeeprathore/nginx thenavdeeprathore/nginx:testing


# Create your own image with new Image ID
docker build -t my_server:1.0 .

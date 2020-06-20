# verified cli can talk to engine
docker version

# most config values of engine
docker info

# starts a new container from an image
# docker run {old way}
docker container run <imagename>

docker ps
docker container ls

docker ps -a
docker container ls -a

docker stop <containerId or containerName>
docker rm <containerId or containerName>

docker images
docker image ls

docker rmi <imageName>

docker pull nginx

docker inspect <containerId or containerName>
docker logs <containerId or containerName>

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)

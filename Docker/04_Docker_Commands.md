## Show the Docker version information (verify cli can talk to engine)
docker version

## Print version information and quit
docker --version
docker -v

## Display system-wide information about Docker
docker info

## Pull an image or a repository from a registry
docker pull nginx

## List images
docker images # old approach
docker image ls

## Run a command in a new container (create a new container or instance from an image)
docker run <imagename> # old approach
docker container run <imagename>

## List default running containers
docker ps # old approach
docker container ls

## Show all containers including stopped containers (default shows just running)
docker ps -a # old approach
docker container ls -a

## Stop one or more running containers
docker stop <containerId or containerName>
docker container stop <containerId or containerName>
docker container stop <containerId or containerName> <containerId or containerName> <containerId or containerName>

## Remove one or more containers
### -f forcefully stops and removes the container
docker rm <containerId or containerName>
docker rm -f <containerId or containerName>
docker container rm <containerId or containerName>
docker container rm -f <containerId or containerName>
docker container rm <containerId or containerName> <containerId or containerName> <containerId or containerName>
docker container rm -f <containerId or containerName> <containerId or containerName> <containerId or containerName>

## Remove one or more images
docker rmi <imageName>
docker image rmi <imageName>

## STOP ALL, REMOVE ALL
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rm -f $(docker ps -aq)
docker rmi $(docker images -aq)

## Automatically remove the container when it exits
### -rm
docker container run -rm -p 80:80 -d --name myserver nginx sleep 5

## Return low-level information on Docker objects
docker inspect <containerId or containerName>
## Fetch the logs of a container
docker logs <containerId or containerName>

## Disk usage metrics for docker components
docker system df
docker system df -v # per component wise usage

Commands:
  build       Build an image from a Dockerfile
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Display detailed information on one or more images
  load        Load an image from a tar archive or STDIN
  ls          List images
  prune       Remove unused images
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rm          Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE

# Images List
docker image ls

# Image Inspect
docker image inspect nginx
    # Display docker image ID
    docker image inspect nginx --format='{{.Id}}'
    # Display docker image Repository and Tags
    docker image inspect nginx --format='{{.RepoTags}}'
    # Display docker image Exposed Ports
    docker image inspect nginx --format='{{.ContainerConfig.ExposedPorts}}'
    # Display docker image Hostname
    docker image inspect nginx --format='{{.ContainerConfig.Hostname}}'

# Image Prune
# NOTE: prune can be applied to images, containers, network, volume
# By default, the above command will only clean up dangling images
# Dangling images => Image without tags and Image not referenced by any container
docker image prune
# This will remove all the images which does not have the container associated with them
docker image prune -a


# Image History -- show all the layers
docker image history ubuntu


# Flattening Docker Images
# Flattening a image to single layer can help reduce the overall size of the image
# use export and import
docker container run -d --name myubuntu ubuntu
docker export myubuntu > myubuntudemo.tar
la -l myubuntudemo.tar
cat myubuntudemo.tar | docker import - myubuntu:latest
docker images


# Docker Registry -- similar like GitHub
various types of registry are available: 
- Docker Registry (Open Source, limited features)
- Docker Trusted Registry (Enterprise, lots of features)
- Docker Hub
- Private Repository (AWS ECR)
- Private Repository (Azure Container Registry)
- Private Repository (Google Container Registry)


# push images to Docker Hub
docker tag ubuntu thenavdeeprathore/ubuntu
docker login
docker push thenavdeeprathore/ubuntu
# pull images from Docker Hub
docker pull thenavdeeprathore/ubuntu


# Docker search
docker search nginx --limit 5
docker search nginx --filter "is-official=true"

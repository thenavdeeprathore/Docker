# starts a new nginx container from an image
docker container run --publish 80:80 nginx
# 1. Downloaded image 'nginx' from Docker hub
# 2. Started a new container from that image
# 3. Opened port / Exposed port 80 on the host IP
# 4. Routes that traffic to the container IP, port 80

# --detach or -d tells docker to run in the background
docker container run --publish 80:80 --detach nginx

# --name will print name for the docker
docker container run -p 8080:80 -d --name webserver nginx

# check logs
docker container logs webserver

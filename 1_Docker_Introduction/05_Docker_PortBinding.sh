# starts a new nginx container from an image with attach mode
docker container run --publish 8080:80 nginx
# 1. Downloaded image 'nginx' from Docker hub
# 2. Started a new container from that image
# 3. Opened port / Exposed port 8080 on the host IP
# 4. Routes that traffic to the container IP, port 80

# NOTE: we can't use the same exposed host port for other running containers. Always use unique host port bindings
navdeep@navdeeplabs:~$ docker run -p 8080:80 nginx
docker: Error response from daemon: driver failed programming external connectivity on endpoint exciting_visvesvaraya 
(0e5b7a8fc14d09fc343228a839d4dc78cc4db796e466638676e46cfcf368a2ae): Bind for 0.0.0.0:8080 failed: port is already allocated.

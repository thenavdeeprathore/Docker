# starts a new nginx container from an image with attach mode
docker run --publish 8080:80 nginx
# 1. Downloaded image 'nginx' from Docker hub
# 2. Started a new container from that image
# 3. Opened port / Exposed port 8080 on the host IP
# 4. Routes that traffic to the container IP, port 80

# open browser and enter url 192.168.66.131:8080
http://192.168.66.131:8080/

# This will show logs on the fore-ground in the terminal
navdeep@navdeeplabs:~$ docker run -p 8080:80 nginx
192.168.66.131 - - [31/May/2020:09:30:43 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36" "-"
2020/05/31 09:30:43 [error] 6#6: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.66.131, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "192.168.66.131:8080", referrer: "http://192.168.66.131:8080/"
192.168.66.131 - - [31/May/2020:09:30:43 +0000] "GET /favicon.ico HTTP/1.1" 404 556 "http://192.168.66.131:8080/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36" "-"

# This will stop the running container
Ctrl + C

# --detach or -d tells docker to run in the background
docker container run --publish 80:80 --detach nginx

# --name will print name for the docker
docker container run -p 8080:80 -d --name webserver nginx

# check logs
docker container logs webserver

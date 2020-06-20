# Each container connected to a private virtual network "bridge"
# Each virtual network routes through NAT firewall on host IP
# All containers on virtual network can talk to each other with -p / --publish
# Best practise is to create a new virtual network for each app:
# --> network "my-web-app" for mysql and apache containers
# --> network for "my_api" for mongo and nodejs containers
# make new virtual networks
# Attach containers to more than one virtual network (or none)
# Skip virtual networks and use host IP (--net=host)
docker container run -p 8080:80 -d --name webserver nginx
docker container port webserver
# 80/tcp -> 0.0.0.0:8080

# --format a common option for formatting hte output of commands using "Go templates"
# Find the IP Address of the container
docker container inspect --format '{{ .NetworkSettings.IPAddress }}' webserver


# Docker Networks : CLI Management
# 1) Show Networks                    docker network ls
# 2) Inspect Network                  docker network inspect
# 3) Create a Network                 docker network create --driver
# 4) Attach network to container      docker network connect
# 5) Detach a network from container  docker network disconnect

docker network ls
navdeep@navdeeplabs:~$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
73d1d0b5e19b        bridge              bridge              local
33851302df6b        host                host                local
079ad51ff550        none                null                local


docker network inspect bridge
navdeep@navdeeplabs:~$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "73d1d0b5e19b960e73abcb2c2a1ae81f6292807b78de9696972ed793c0c960eb",
        "Created": "2020-05-25T21:10:43.594579786+05:30",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "7f16fa89a448bf3ffacaa50df72ac51825fdea6880db1179571ebef2ce89cdde": {
                "Name": "webserver",
                "EndpointID": "f18b3c4fb592369881f7812f95c04cc53296e295c623889c8c13a604b8e680c0",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]


docker network create my_app_net
navdeep@navdeeplabs:~$ docker network create my_app_net
4972d5f5b77c89b51c9b16e4c1856cd8fac70258288ecc767ae4aea3a05b3701
navdeep@navdeeplabs:~$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
73d1d0b5e19b        bridge              bridge              local
33851302df6b        host                host                local
4972d5f5b77c        my_app_net          bridge              local
079ad51ff550        none                null                local


docker container run -d -p 8080:80 --name new_nginx --network my_app_net nginx


# Docker Networks : Docker Security
# Create your apps so frontend/backend sit on same docker network
# Their inter-communication never leaves host
# All external exposed ports are closed by default
# You must manually expose via -p
# This even gets better later with Swarm and Overlay Networks

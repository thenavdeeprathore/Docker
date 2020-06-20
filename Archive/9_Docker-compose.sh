# tools for defining and runnning multi-container docker applications
# use yaml files to configure application services (docker-compose.yml)
# can start all services with a single command: docker compose up
# can stop all services with a single command: docker compose down
# can scale up selected service when required

touch docker-compose.yaml


version: '3'

services:
  web:
    image: nginx
    ports:
      - 8080:80

  database:
    image: redis


docker-compose config

docker-compose up
docker-compose up -d
docker-compose up -d --scale databse=3
docker-compose down
docker-compose ps
docker ps

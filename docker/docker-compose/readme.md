### Running Docker Image as container:

```
  docker run -p --name sample1 8080:80 amitkshirsagar13/sample-service:24


  docker-compose up
  docker-compose up -d (Detached mode, in background)



  Before Running Docker Stack, you need to have docker swarm:

  docker stack deploy sample-service --compose-file docker-compose.yaml
  docker stack ls
  docker ps
  docker stack rm

```


### Docker Network with subnet:

```
docker network create -d overlay \
  --subnet=192.168.10.0/25 \
  --subnet=192.168.20.0/25 \
  --gateway=192.168.10.100 \
  --gateway=192.168.20.100 \
  --aux-address="my-router=192.168.10.5" --aux-address="my-switch=192.168.10.6" \
  --aux-address="my-printer=192.168.20.5" --aux-address="my-nas=192.168.20.6" \
  sample-service-network
```
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
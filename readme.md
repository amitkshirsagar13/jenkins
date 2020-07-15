### Login
```
admin
Admin#123
```

### Run Jenkins Server in Docker Container:
```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-server -v C:/docker-share/jenkins/server/jenkins_home/:/var/jenkins_home amitkshirsagar13/k8s-jenkins-server:latest
```


### Run Slave with below configuration:
```
volume
/host_mnt/c/docker-share/jenkins/slave/:/maven


```"# jenkins" 

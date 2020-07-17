### Login
```
admin
Admin#123
```
### Build Images:

```
docker build -t amitkshirsagar13/k8s-jenkins-server:latest . -f Dockerfile.deb && docker push amitkshirsagar13/k8s-jenkins-server:latest
docker build -t amitkshirsagar13/k8s-jenkins-server:alp-lts . -f Dockerfile.alpine && docker push amitkshirsagar13/k8s-jenkins-server:apl-lts

docker build -t amitkshirsagar13/k8s-jenkins-slave:latest . -f Dockerfile.deb && docker push amitkshirsagar13/k8s-jenkins-slave:latest
docker build -t amitkshirsagar13/k8s-jenkins-slave:alp-lts . -f Dockerfile.alpine && docker push amitkshirsagar13/k8s-jenkins-slave:apl-lts
```


### Run Jenkins Server in Docker Container:
```
docker run -d --restart unless-stopped -p 8080:8080 -p 50000:50000 --name jenkins-server -v /opt/jenkins/jenkins_home/:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock amitkshirsagar13/k8s-jenkins-server:alp-lts

chown jenkins:jenkins /var/run/docker.sock
```

### Run Slave with below configuration:
```
Image: amitkshirsagar13/k8s-jenkins-slave:alp-lts

Jenkins Url:
Your Jenkins Container Url

volume: 
/opt/jenkins/agent/:/home/jenkins/agent 
/var/run/docker.sock:/var/run/docker.sock 
/opt/jenkins/maven/:/home/jenkins/.m2

```


### Alternatively, we can share the docker host port:
```
socat -d TCP-LISTEN:2376,range=127.0.0.1/32,reuseaddr,fork UNIX:/var/run/docker.sock

docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 2376:2375 bobrik/socat TCP4-LISTEN:2375,fork,reuseaddr UNIX-CONNECT:/var/run/docker.sock
```
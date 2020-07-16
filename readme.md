### Login
```
admin
Admin#123
```
### Build Images:

```
docker build -t amitkshirsagar13/k8s-jenkins-server:latest .

```


### Run Jenkins Server in Docker Container:
```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-server -v C:/docker-share/jenkins/server/jenkins_home/:/var/jenkins_home amitkshirsagar13/k8s-jenkins-server:latest

docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-server -v "/Users/admin/tmp/jenkins/jenkins_home/:/var/jenkins_home" -v "/var/run/docker.sock:/var/run/docker.sock" amitkshirsagar13/k8s-jenkins-server:latest


chown jenkins:jenkins /var/run/docker.sock

```


### Run Slave with below configuration:
```
volume
/Users/admin/tmp/jenkins/jenkins_home/:/home/jenkins/agent 
/var/run/docker.sock:/var/run/docker.sock 
/Users/admin/tmp/jenkins/maven/:/home/jenkins/.m2


```"# jenkins" 

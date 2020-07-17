FROM jenkins/jnlp-slave:latest
LABEL maintainer="Amit Kshirsagar <amit.kshirsagar.13@gmail.com>"
USER root

# RUN groupadd docker
# RUN usermod -aG docker jenkins
# RUN groups jenkins
# RUN echo "if [ -e /var/run/docker.sock ]; then sudo chown jenkins:docker /var/run/docker.sock; fi" >> /home/jenkins/.profile

#install docker
RUN curl -sSL https://get.docker.com/ | sh

#install sudo
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*

#Adding jenkins to sudoers list and making an alias for sudo docker
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
      && printf '#!/bin/bash\nsudo /usr/bin/docker "$@"' > /usr/local/bin/docker \
      && chmod +x /usr/local/bin/docker

RUN usermod -aG docker jenkins

ARG MAVEN_VERSION=3.6.3

ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && echo "Downlaoding maven" \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  \
  && echo "Unziping maven" \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

ARG MAVEN_HOME_DIR="/home/jenkins"
ENV MAVEN_CONFIG "$MAVEN_HOME_DIR/.m2"
VOLUME [/home/jenkins/.m2]

# USER jenkins

FROM jenkins/jenkins:lts-alpine

LABEL maintainer="Amit Kshirsagar <amit.kshirsagar.13@gmail.com>"

USER root
RUN apk add --no-cache curl tar bash procps


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

RUN rm /usr/share/jenkins/jenkins.war

RUN curl -fsSL -o /usr/share/jenkins/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war

ENV MAVEN_HOME /usr/share/maven

ARG MAVEN_HOME_DIR="/maven"
ENV MAVEN_CONFIG "$MAVEN_HOME_DIR/.m2"

ENV JENKINS_SLAVE_AGENT_PORT 50000

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

USER jenkins
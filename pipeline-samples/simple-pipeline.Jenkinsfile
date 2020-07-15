pipeline {
  agent none
  stages {
    stage('Checkout') {
      agent {
        docker {
          label 'slave'
          image 'amitkshirsagar13/k8s-jenkins-slave:latest'
        }
      }
      steps {
        // Get some code from a GitHub repository
        git 'https://github.com/amitkshirsagar13/sample-service.git'
      }
    }
    stage('Build') {
      agent {
        docker {
          label 'slave'
          image 'amitkshirsagar13/k8s-jenkins-slave:latest'
        }
      }
      steps {
        // Run Maven on a Unix agent.
        sh "mvn -Dmaven.test.failure.ignore=true clean compile"
      }
    }
    stage('Test') {
      agent {
        docker {
          label 'slave'
          image 'amitkshirsagar13/k8s-jenkins-slave:latest'
        }
      }
      steps {
        // Run Maven on a Unix agent.
        sh "mvn -Dmaven.test.failure.ignore=true test"
      }
      post {
          success {
              junit '**/target/surefire-reports/TEST-*.xml'
              archiveArtifacts 'target/*.jar'
          }
      }
    }
    stage('Package') {
      agent {
        docker {
          label 'slave'
          image 'amitkshirsagar13/k8s-jenkins-slave:latest'
        }
      }
      steps {
        // Run Maven on a Unix agent.
        sh "mvn -Dmaven.test.failure.ignore=true clean package"
      }
    }
    stage('DockerPackage') {
      agent {
        docker {
          label 'slave'
          image 'amitkshirsagar13/k8s-jenkins-slave:latest'
        }
      }
      steps {
        // Run Docker Build on a Unix agent.
        sh "docker build -t amitkshirsagar13/sample-service-from-pipeline ."
      }
    }
  }
}

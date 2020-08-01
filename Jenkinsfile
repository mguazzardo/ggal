pipeline {
  environment {
    registry = "mguazzardo/curso"
    //registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/mguazzardo/s2i.git'
      }
    }
    stage('Building image') {
      steps{
        sh '''
        s2i build https://github.com/mguazzardo/ggal.git centos/php-71-centos7 php-test-app    
           '''
      }
    }
    stage('Deploy Image') {
      steps{
        
        sh '''
        docker run -d --name=php-test -p 8084:8080 php-test-app   
           '''
        }
      }
  }
}

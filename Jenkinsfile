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
        //sh 'git clone https://github.com/mguazzardo/s2i.git'
          git 'https://github.com/mguazzardo/ggal.git'
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

    stage('Test') {
            steps {
                sh  '''
                    echo 'probando con curl'
                    chmod +x curl_test2.sh
                     ./curl_test2.sh
                    '''
            }
        }

    stage('Run kubectl'){
             steps {
                 sh  '''
                     ansible-playbook playbook.yml
                     '''
                   }
      }

  }
}

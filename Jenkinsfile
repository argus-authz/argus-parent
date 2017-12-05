pipeline {
  
  agent { label 'maven' }
  
  options {
    timeout(time: 1, unit: 'HOURS')
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  
  triggers {
    cron('@daily')
  }
  
  stages {
    stage('prepare') {
      steps {
        container('maven-runner'){
          sh 'sed -i \'s#http:\\/\\/radiohead\\.cnaf\\.infn\\.it:8081\\/nexus\\/content\\/repositories#https:\\/\\/repo\\.cloud\\.cnaf\\.infn\\.it\\/repository#g\' pom.xml'
        }
      }
    }
    
    stage('deploy') {
      steps {
        container('maven-runner'){
          sh "mvn clean -U -B deploy"
        }
      }
    }
  }
  
  post {
    failure {
      slackSend color: 'danger', message: "${env.JOB_NAME} - #${env.BUILD_NUMBER} Failure (<${env.BUILD_URL}|Open>)"
    }
  }
}

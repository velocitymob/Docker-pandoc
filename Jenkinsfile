pipeline {
  agent any
  stages {
    stage('test') {
      parallel {
        stage('test') {
          agent {
            dockerfile {
              filename 'Dockerfile'
            }

          }
          environment {
            Test = '1'
          }
          steps {
            sh 'bash echo "test"'
          }
        }
        stage('test2') {
          steps {
            echo 'this is a test'
          }
        }
      }
    }
  }
}
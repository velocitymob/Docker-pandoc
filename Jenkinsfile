pipeline {
  agent any
  stages {
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
  }
}
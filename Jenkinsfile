pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('buildit') {
      steps {
        sh 'docker built -t test .'
      }
    }
  }
}
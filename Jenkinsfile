pipeline {
  agent {
    dockerfile {
      filename 'buildit'
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
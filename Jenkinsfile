pipeline {

    agent any
    
    environment {
        PASS = credentials('registry-pass') 
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh '''
		     checkout scm
		     docker build -t sandeepkaukab/multi-client:latest -t sandeepkaukab/multi-client:$BUILD_ID -f ./client/Dockerfile ./client
		     docker build -t sandeepkaukab/multi-server:latest -t sandeepkaukab/multi-server:$BUILD_ID -f ./server/Dockerfile ./server
		     docker build -t sandeepkaukab/multi-worker:latest -t -t sandeepkaukab/multi-worker:$BUILD_ID -f ./worker/Dockerfile ./worker
                '''
            }

        }

        stage('Test') {
         steps {
	sh '''
          echo "test is running"
	   '''
        }
	}

        stage('Push') {
	steps {
        sh '''
          echo "Push is going on"
           '''
        }
	}

        stage('Deploy') {
	steps {
        sh '''
          echo "Deploy is going on"
           '''
        }
	}
    }
}

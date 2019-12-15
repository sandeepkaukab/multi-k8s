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
		     docker build -t sandeepkaukab/multi-client:latest -t sandeepkaukab/multi-client:$SHA -f ./client/Dockerfile ./client
		     docker build -t sandeepkaukab/multi-server:latest -t sandeepkaukab/multi-server:$SHA -f ./server/Dockerfile ./server
		     docker build -t sandeepkaukab/multi-worker:latest -t -t sandeepkaukab/multi-worker:$SHA -f ./worker/Dockerfile ./worker
                '''
            }

        }

        stage('Test') {
            steps {
            }

        }

        stage('Push') {
            steps {
            }
        }

        stage('Deploy') {
            steps {
            }
        }
    }
}

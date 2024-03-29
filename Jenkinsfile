pipeline {

    agent any
    

    stages {

        stage('Build Docker Image') {
            steps {
		     checkout scm
                sh '''
		     docker build -t sandeepkaukab/multi-client:latest -t sandeepkaukab/multi-client:$BUILD_ID -f ./client/Dockerfile ./client
		     docker build -t sandeepkaukab/multi-server:latest -t sandeepkaukab/multi-server:$BUILD_ID -f ./server/Dockerfile ./server
		     docker build -t sandeepkaukab/multi-worker:latest -t sandeepkaukab/multi-worker:$BUILD_ID -f ./worker/Dockerfile ./worker
                '''
            }

        }

        stage('Push Docker Image') {
         steps {
	  withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
	sh '''
          docker push sandeepkaukab/multi-client:latest
	  docker push sandeepkaukab/multi-server:latest
	  docker push sandeepkaukab/multi-worker:latest
	  docker push sandeepkaukab/multi-client:$BUILD_ID
	  docker push sandeepkaukab/multi-server:$BUILD_ID
	  docker push sandeepkaukab/multi-worker:$BUILD_ID
	   '''
	 }
        }
	}

        stage('Test') {
	steps {
        sh '''
          echo "Push is going on"
           '''
        }
	}

        stage('Deploy images on kubernetes') {
	steps {
        sh '''
            kubectl apply -f k8s
	    kubectl set image deployments/server-deployment server=sandeepkaukab/multi-server:$BUILD_ID
	    kubectl set image deployments/client-deployment client=sandeepkaukab/multi-client:$BUILD_ID
	    kubectl set image deployments/worker-deployment worker=sandeepkaukab/multi-client:$BUILD_ID

           '''
        }
	}
    }
}

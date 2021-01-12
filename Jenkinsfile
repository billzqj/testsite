pipeline {
	agent none
	stages {
		stage('pull code'){
			agent any
			
			steps {
				git 'https://github.com/billzqj/testsite.git'
			}
		}
		
		stage('build images') {
			agent any
			
			steps {
				sh "docker build -t mywebsite:latest ."
			}
		}
		
		stage('deployment') {
			agent any
			steps {
				sh 'docker ps -a | grep mywebsite  && docker rm -f mywebsite || echo "mywebsite is not exist!"'
				sh 'docker run -d -p 80:5000 --name mywebsite --restart=always mywebsite:latest'
			}
		}
		
		stage('autotest') {
			agent any
			steps {
				sh 'chmod +x autotest.sh'
				sh './autotest.sh'
			}
		}
		
		//stage('publish prod') {
		//	agent any
		//	steps {
		//		sh 'docker ps -a | grep mywebsite  && docker rm -f mywebsite || echo "mywebsite is not exist!"'
		//		sh 'docker run -d -p 80:5000 --name mywebsite --restart=always mywebsite:latest'
		//	}
		//}
	}
}

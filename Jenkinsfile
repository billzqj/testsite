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
		
		stage('publish') {
			agent any
			steps {
				sh 'docker ps -a | grep mywebsite  && docker rm -f mywebsite || echo "mywebsite is not exist!"'
				sh 'docker run -d -p 80:5000 --name mywebsite --restart=always mywebsite:latest'
			}
		}
	    
	    stage('test') {
			agent any
			steps {
				sh '[[ $(curl -I -m 10 -o /dev/null -s -w %{http_code} http://localhost:80) -eq 200 ]] && echo "website publish successful!" || echo "website publish failed!"'
			}
		}
    }
}

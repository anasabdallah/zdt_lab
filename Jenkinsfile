pipeline {
	environment {
        VERSION = ""
    }
    agent any
    stages {
	    stage('prebuild') {
		    steps {
                script {
                    VERSION = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                }		
			}
		}
        stage('build') {
            steps {
			    script {
				    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
      			        def app = docker.build("anasabdullah/zdt-app:${VERSION}", '.').push()
    			    }
			    }
            }
        }
	    stage('deploy') {
		    steps {
                sshagent(credentials : ['hostkey']) {
                    sh 'ssh -o StrictHostKeyChecking=no anas@10.142.0.21 ls'
                }
		    }
	    }
    }
    post { 
        always {
            sh 'docker image prune -a --force --filter "until=48h"'
            cleanWs()
        }
    }
}

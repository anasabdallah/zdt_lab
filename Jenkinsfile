pipeline {
    agent any
    stages {
        stage('build') {
            steps {
			    script {
				    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
      			        def app = docker.build("anasabdullah/zdt-app", '.').push()
    			    }
			    }
            }
        }
	    stage('deploy') {
		    steps {
                sshagent(credentials : ['hostkey']) {
                    sh 'ssh -o StrictHostKeyChecking=no anas@10.142.0.21 bash deployment.sh'
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

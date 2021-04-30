pipeline {
	agent any
    stages {
	stage('Build') {
		agent { docker {'maven:3-alpine' reuseNode true} }
            steps {
                sh 'mvn -B -DskipTests clean package'
                archiveArtifacts artifacts: 'project/target/*.war', fingerprint: true, followSymlinks: false, onlyIfSuccessful: true
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deliver') {
            steps {
                // sh './jenkins/scripts/deliver.sh'
                sh 'docker build -t gowthammuthyala/${JOB_NAME} .'
            	sh 'docker run -it -p 9000:8080 -d gowthammuthyala/${JOB_NAME}'
	    }
        }
    }
}

pipeline {
    agent any

    environment {
        dockerImage = ''
        registry = 'mohan006007/dev'
        registryCredential = 'dockerhub-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Mohan006007/react-app-docker-deployment.git']])
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        stage ('Push Docker image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push 'latest'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

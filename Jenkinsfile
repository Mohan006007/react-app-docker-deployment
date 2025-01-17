pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], 
                    userRemoteConfigs: [[url: 'https://github.com/Mohan006007/react-app-docker-deployment.git', credentialsId: 'github-credentials']]])
            }
        }
        stage('Debug Workspace') {
            steps {
                sh 'ls -la'
            }
        }
        stage('Build and Run Docker Containers') {
            steps {
                script {
                    sh 'docker-compose down' // Stop and clean up if already running
                    sh 'docker-compose build'
                    sh 'docker-compose up -d'
                }
            }
        }
        stage('Push Docker Image to Dev') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        sh 'docker-compose push'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Cleanup workspace
            script {
                sh 'docker-compose down' // Ensure containers are stopped
            }
        }
    }
}


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
                    // Clean up previous containers, if any
                    sh 'docker-compose down'

                    // Build the Docker images
                    sh 'docker-compose build'

                    // Start the containers in detached mode
                    sh 'docker-compose up -d'

                    // Optional: View logs (helpful for debugging)
                    sh 'docker-compose logs'
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
                // Ensure containers are stopped
                sh 'docker-compose down'
            }
        }
    }
}


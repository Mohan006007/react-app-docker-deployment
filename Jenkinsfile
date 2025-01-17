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
                sh 'ls -la' // List files in workspace to debug
            }
        }

        stage('Build and Run Docker Containers') {
            steps {
                script {
                    // Clean up any previous containers
                    sh 'docker-compose down || true' // Using `|| true` to ignore errors if containers are not found
                    sh 'docker-compose build' // Build the Docker image
                    sh 'docker-compose up -d' // Run containers in detached mode
                }
            }
        }

        stage('Push Docker Image to Dev') {
            steps {
                script {
                    // Push the built Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        sh 'docker-compose push' // Push Docker images to Docker Hub
                    }
                }
            }
        }
    }

    post {
        always {
            // Cleanup the workspace and stop containers
            cleanWs() 
            script {
                sh 'docker-compose down || true' // Ensure containers are stopped and cleaned up
            }
        }
    }
}


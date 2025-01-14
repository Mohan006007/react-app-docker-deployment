pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')
        GIT_CREDENTIALS = credentials('git-credentials')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                script {
                    // Use git credentials to clone the repository
                    git credentialsId: 'git-credentials', url: 'https://github.com/Mohan006007/react-app-docker-deployment.git'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("mohan006007/dev-repo:dev")
                }
            }
        }

        stage('Push to Docker Hub - Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS) {
                        docker.image("mohan006007/dev-repo:dev").push()
                    }
                }
            }
        }

        stage('Push to Docker Hub - Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS) {
                        docker.image("mohan006007/dev-repo:prod").push()
                    }
                }
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                // Deployment logic for production
            }
        }

        stage('Declarative: Post Actions') {
            steps {
                cleanWs()
            }
        }
    }
}

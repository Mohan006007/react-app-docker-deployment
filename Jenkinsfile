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
                    // Ensure the block is treated as a closure
                    checkout scm
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Docker build step
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
                    // Pushing to Docker Hub - Dev
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
                    // Pushing to Docker Hub - Prod
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS) {
                        docker.image("mohan006007/dev-repo:prod").push()
                    }
                }
            }
        }

        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }
    }
}


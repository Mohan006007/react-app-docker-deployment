pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials') // DockerHub credentials ID
        GITHUB_CREDENTIALS = credentials('github-credentials') // GitHub credentials ID
        IMAGE_NAME_DEV = 'mohan006007/dev'
        IMAGE_NAME_PROD = 'mohan006007/prod'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from GitHub
                git url: 'https://github.com/Mohan006007/react-app-docker-deployment.git', credentialsId: 'github-credentials'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image for development
                script {
                    def app = docker.build("${IMAGE_NAME_DEV}")
                }
            }
        }

        stage('Push to Docker Hub (Dev)') {
            when {
                branch 'dev'
            }
            steps {
                // Push the Docker image to Docker Hub (dev)
                script {
                    docker.withRegistry('', 'dockerhub-credentials') {
                        app.push()
                    }
                }
            }
        }

        stage('Merge to Master') {
            when {
                branch 'master'
            }
            steps {
                // After merging dev into master, build and push the Docker image to prod repo
                script {
                    def prodApp = docker.build("${IMAGE_NAME_PROD}")
                    docker.withRegistry('', 'dockerhub-credentials') {
                        prodApp.push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up any resources after build completion
            cleanWs()
        }
    }
}


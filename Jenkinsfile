pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials') // Add your Docker credentials here
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Build Docker image for dev
                    sh 'docker build -t mohan006007/dev:dev .'
                }
            }
        }

        stage('Push to Docker Hub - Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    // Push Docker image to the dev repo (public)
                    sh 'docker push mohan006007/dev:dev'
                }
            }
        }

        stage('Push to Docker Hub - Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Push Docker image to the prod repo (private)
                    sh 'docker push mohan006007/prod:latest'
                }
            }
        }

        stage('Cleanup') {
            steps {
                cleanWs()  // Clean workspace
            }
        }
    }
}

>

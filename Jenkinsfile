pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')
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
                    sh 'docker push mohan006007/prod:latest'
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


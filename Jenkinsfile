pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], 
                    userRemoteConfigs: [[url: 'https://github.com/Mohan006007/react-app-docker-deployment.git', credentialsId: 'github-credentials']]])
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("your-dockerhub-username/dev-image:latest")
                }
            }
        }
        stage('Push Docker Image to Dev') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        docker.image("your-dockerhub-username/dev-image:latest").push()
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Directly use cleanWs in the post section
        }
    }
}

pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker-hub-credentials'
        GIT_CREDENTIALS = 'git-credentials'
        DOCKER_REPO_DEV = 'mohan006007/dev-repo'
        DOCKER_REPO_PROD = 'mohan006007/prod-repo'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: "${GIT_CREDENTIALS}", url: 'https://github.com/Mohan006007/react-app-docker-deployment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def branch = env.GIT_BRANCH.replaceAll('origin/', '')
                    def tag = branch == 'dev' ? 'dev' : 'prod'
                    sh """
                        docker build -t ${DOCKER_REPO_DEV}:${tag} .
                    """
                }
            }
        }

        stage('Push to Docker Hub - Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                            docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                            docker push ${DOCKER_REPO_DEV}:dev
                        """
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
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh """
                            docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                            docker push ${DOCKER_REPO_PROD}:prod
                        """
                    }
                }
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh './deploy.sh'
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

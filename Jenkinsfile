pipeline {
    agent any

    tools {
       dockerTool 'docker'
       nodejs 'nodejs18'
    }


    environment {
        GIT_REPO = 'https://github.com/techpentest/nodejs-todo-app.git'
        IMAGE_NAME = 'testlab/app1'
        CONTAINER_NAME = 'nodejs-app'
    }

    stages {
        stage('Install Docker (if missing)') {
            steps {
                sh '''
                if ! command -v docker > /dev/null; then
                    echo "Docker not found. Installing Docker..."
                    curl -fsSL https://get.docker.com -o get-docker.sh
                    sudo sh get-docker.sh
                    sudo usermod -aG docker $USER
                    sudo newgrp docker
                else
                    echo "Docker is already installed."
                fi
                '''
            }
        }

        stage('Clone GitHub Repository') {
            steps {
                git branch: 'main', url: "${env.GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "sudo docker build -t ${IMAGE_NAME}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                    sudo -S docker stop ${CONTAINER_NAME} || true
                    sudo -S docker rm ${CONTAINER_NAME} || true
                    sudo -S docker run -d --name ${CONTAINER_NAME} -p 3000:3000 ${IMAGE_NAME}:${BUILD_NUMBER}
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Application deployed successfully."
        }
        failure {
            echo "Deployment failed. Check logs."
        }
    }
}

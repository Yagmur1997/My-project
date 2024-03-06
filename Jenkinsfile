pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'https://hub.docker.com/'  // Change this to your Docker registry if needed
        DOCKER_USERNAME = 'aidanasharip0797'
        DOCKER_PASSWORD = 'kaisaraidana1997'
        DOCKER_IMAGE = 'nginx-custom:latest'  // Change this to your desired image name and tag
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(env.DOCKER_IMAGE, '-f Dockerfile .')
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD $DOCKER_REGISTRY"
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }
    }
}
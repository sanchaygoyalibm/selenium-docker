pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image'){
            steps{
                bat 'podman build -t=docker.io/sangoya/selenium:latest .'
            }
        }

        stage('Push Image'){
            environment{
                DOCKER_HUB = credentials('dockerhub-creds')
            }
            steps{
                bat 'echo ${DOCKER_HUB_PSW} | docker login -u ${DOCKER_HUB_USR} --password-stdin'
                bat 'podman push docker.io/sangoya/selenium:latest'
            }
        }

    }

    post {
        always {
            bat 'docker logout'
        }
    }
}
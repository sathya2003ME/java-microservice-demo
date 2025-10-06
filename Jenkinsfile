pipeline {
    agent any

stage('Checkout') {
    steps {
        git branch: 'main',
            url: 'https://github.com/sathyask2003ME/java-microservice-demo.git',
            credentialsId: 'github-pat-cred'
    }
}


        stage('Build App') {
            steps {
                sh './gradlew build'
            }
        }

        stage('Run Tests') {
            steps {
                sh './gradlew test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-microservice-demo .'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/build/libs/*.jar', allowEmptyArchive: true
        }
    }


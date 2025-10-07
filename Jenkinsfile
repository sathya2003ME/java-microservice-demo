pipeline {
    agent any
    tools {
        jdk 'jdk21'   // Matches the name you gave in Jenkins
    }

    environment {
        GIT_PAT = credentials('github-pat-cred')
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning GitHub repository..."
                git branch: 'main', url: 'https://github.com/sathya2003ME/java-microservice-demo.git', credentialsId: 'github-pat-cred'
            }
        }

        stage('Build App') {
            steps {
                echo "Building Java microservice..."
                sh './gradlew clean build'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running unit tests..."
                sh './gradlew test'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline succeeded with JDK 21!"
        }
        failure {
            echo "❌ Pipeline failed — check logs."
        }
    }
}

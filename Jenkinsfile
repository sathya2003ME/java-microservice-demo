pipeline {
    agent any

    environment {
        GIT_PAT = credentials('github-pat-cred')  // GitHub Personal Access Token
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning GitHub repository..."
                git branch: 'main', 
                    url: 'https://github.com/sathya2003ME/java-microservice-demo.git', 
                    credentialsId: 'github-pat-cred'
            }
        }

        stage('Build App') {
            steps {
                echo "Building Java microservice using Gradle Wrapper..."
                // Use wrapper instead of system Gradle
                sh './gradlew clean build --no-daemon'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running unit tests using Gradle Wrapper..."
                sh './gradlew test --no-daemon'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t java-microservice-demo:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
                sh 'docker run -d --name java-microservice-demo -p 8080:8080 java-microservice-demo:latest'
            }
        }
    }

    post {
        always {
            echo "Cleaning up Docker container..."
            sh 'docker stop java-microservice-demo || true'
            sh 'docker rm java-microservice-demo || true'
        }
        success {
            echo "✅ Pipeline succeeded!"
        }
        failure {
            echo "❌ Pipeline failed — check logs."
        }
    }
}

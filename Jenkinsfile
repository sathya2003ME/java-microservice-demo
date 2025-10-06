pipeline {
    agent any

    environment {
        GIT_PAT = credentials('github-pat-cred')
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning GitHub repository..."
                git url: "https://sathyask2003ME:${GIT_PAT}@github.com/sathya2003ME/java-microservice-demo.git",
                    branch: 'main'
            }
        }

        stage('Build App') {
            steps {
                echo "Building the app..."
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running tests..."
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}

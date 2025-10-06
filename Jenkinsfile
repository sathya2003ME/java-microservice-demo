pipeline {
    agent any   // Run on any available Jenkins agent

    environment {
        GIT_USER = "sathyask2003ME"              // Your GitHub username
        GIT_PAT  = credentials('github-pat-cred') // Jenkins credential ID for your GitHub PAT
        DOCKER_IMAGE = "demo-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning GitHub repository..."
                git branch: 'main',
                    url: "https://github.com/sathyask2003ME/java-microservice-demo.git",
                    credentialsId: 'github-pat-cred'
            }
        }

        stage('Build App') {
            steps {
                echo "Building Java microservice..."
                sh './gradlew build'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running unit tests..."
                sh './gradlew test'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
                sh "docker run -d -p 8080:8080 --name demo-app-container ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}

pipeline {
    agent any

    environment {
        GIT_PAT = credentials('github-pat-cred')
        JAVA_HOME = '/usr/lib/jvm/java-21-openjdk-amd64'
        PATH = "${JAVA_HOME}/bin:${env.PATH}"
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
                sh './gradlew clean build --no-daemon --stacktrace'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running unit tests using Gradle Wrapper..."
                sh './gradlew test --no-daemon --stacktrace'
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
                sh 'docker run -d --rm --name java-microservice-demo -p 8080:8080 java-microservice-demo:latest'
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

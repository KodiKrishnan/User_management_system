pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'usermgmtsys' 
        CONTAINER_NAME = 'User_mgmt_sys' // Name of the running container
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git 'https://github.com/KodiKrishnan/User_management_system.git' // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using docker-compose
                    echo "Building Docker image using docker-compose"
                    sh 'docker-compose build'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    echo "Stopping and removing existing container: ${CONTAINER_NAME}"
                    sh "docker-compose down || true"

                    // Run the new container using docker-compose
                    echo "Starting new container: ${CONTAINER_NAME}"
                    sh 'docker-compose up -d' // Start containers in detached mode
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace
            //cleanWs() changes done 
        }
        success {
            echo "Build succeeded! The application is now deployed."
        }
        failure {
            echo "Build failed! Please check the logs for details."
        }
    }
}

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
                git 'https://github.com/KodiKrishnan/User_management_system.git' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    echo "Stopping and removing existing container: ${CONTAINER_NAME}"
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"

                    // Run the new container
                    echo "Running new container: ${CONTAINER_NAME}"
                    sh "docker run -d --name ${CONTAINER_NAME} -p 4000:4000 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace
            cleanWs()
        }
        success {
            // Optional: Add success notification here (e.g., email or Slack)
            echo "Build succeeded! The application is now deployed."
        }
        failure {
            // Optional: Add failure notification here (e.g., email or Slack)
            echo "Build failed! Please check the logs for details."
        }
    }
}

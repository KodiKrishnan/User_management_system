pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'usermgmtsys' 
        CONTAINER_NAME = 'User_mgmt_sys' Name of the running container
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
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"

                    // Run the new container
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
    }
}

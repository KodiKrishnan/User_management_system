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
                git branch: 'kodii', url: 'https://github.com/KodiKrishnan/User_management_system.git' 
            }
        }

        stage('Print Working Directory') {
            steps {
                script {
                    // Print the current working directory
                    sh 'pwd23'
                    sh 'ls -la'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Navigate to the directory containing docker-compose.yml and build the image
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
            cleanWs()
            echo "Workspace cleaned up."
        }
        success {
            echo "Build succeeded! The application is now deployed."
        }
        failure {
            echo "Build failed! Please check the logs for details."
            // Send email notification only when the build fails
            emailext (
                subject: "Deployment Failed - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "The deployment of ${env.JOB_NAME} Build Number-#${env.BUILD_NUMBER} failed.",
                to: "kodi.m@infosoftjoin.in",
                attachLog: true
            )
        }
        
    }
}

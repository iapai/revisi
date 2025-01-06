pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rifai/hbd:latest'
        CONTAINER_NAME = 'habede'
        PORT_MAPPING = '8085:80'  
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}", '-f Dockerfile .')
                }
            }
        }



        stage('Run Docker Container') {
            steps {
                script {
                        powershell """
                    docker stop ${CONTAINER_NAME} 
                    docker rm ${CONTAINER_NAME} 
                    """
                    docker.image("${DOCKER_IMAGE}").run("-p ${PORT_MAPPING} --name ${CONTAINER_NAME}")
                }
            }
        }
    }
}
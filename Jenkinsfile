pipeline {
    agent any

    environment {
        IMAGE_NAME = 'brht13/devops4'
        IMAGE_TAG  = 'latest'
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Stage 1: Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/brht25/Devops4.git'
            }
        }

        stage('Stage 2: Build') {
            steps {
                sh 'chmod +x ./gradlew && ./gradlew bootJar --no-daemon'
            }
        }

        stage('Stage 3: Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Stage 4: Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Stage 5: Docker Push') {
            steps {
                sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }

        stage('Stage 6: K8s Deploy') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
                sh 'kubectl rollout restart deployment/devops3-deployment'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}

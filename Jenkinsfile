pipeline {
    agent none
        environment {
        //ENV_DOCKER = credentials('dockerhub')
        DOCKERIMAGE = "springboot-demo"
        EKS_CLUSTER_NAME = "demo-cluster"
    }
    stages {
        stage('build') {
            agent {
                docker { image 'openjdk:11-jdk' }
            }
            steps {
                sh 'chmod +x gradlew && ./gradlew build jacocoTestReport'
            }
        }
        // stage('sonarqube') {
        // agent {
        //     docker { image '<some sonarcli image>' } }
        //     steps {
        //         sh 'echo scanning!'
        //     }
        // }
        stage('docker build') {
            steps {
                sh 'ls -all'
                sh 'docker build -t $DOCKERIMAGE:$BUILD_NUMBER .'
            }
        }
        stage('docker push') {
            steps {
                sh 'echo docker push!'
                }
            }
        stage('Deploy App') {
            steps {
                sh 'echo deploy to kubernetes'               
            }
    }
}
}

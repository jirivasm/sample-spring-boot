pipeline {
    agent any
   //    environment {
    //     ENV_DOCKER = credentials('DockerHubSecret')
    //     DOCKERIMAGE = "dummy/dummy"
    //     EKS_CLUSTER_NAME = "demo-cluster"
    //}
    stages {
        stage('build') {
            agent {
                docker { image 'openjdk:11-jdk' }
            }
            steps {
                sh 'chmod +x gradlew && ./gradlew build jacocoTestReport'
            }
        }
        stage('sonarqube') {
        //  agent {
        //      docker { image 'sonarqube:8.9.9-community' } }
            steps {
                sh 'echo scanning!'
            }
        }
        stage('docker build') {
            steps {
                sh 'echo docker build'
                sh 'docker version'
                sh 'docker build -t sampleApp:1.0'

                
            }
        }
        stage('docker push') {
            steps {
                withCredentials([string(credentialsId: 'DockerHubSecret', variable: 'Password')]) {
                    sh 'sudo docker login -u jirivasm -p ${Password} '
                }
                    sh "sudo docker push jirivasm/sampleApp:1.0"
                }
            }
        stage('Deploy App') {
            steps {
                sh 'echo deploy to kubernetes'               
            }
        }
    }
} 

pipeline {
    agent any
    environment {
        DOCKERCRED = credentials('dockercred')
		DOCKER_USERNAME = "${DOCKERCRED_USR}"
		DOCKER_PASSWORD = "${DOCKERCRED_PSW}"
    }

    }
    stages{
        stage ("git checkout") {
          steps {
              git branch: 'main', changelog: false, poll: false, url: 'https://github.com/spring-projects/spring-petclinic.git'
          }
        
          stage ("clean and compile") {      
            steps  {
              sh 'mvnw clean compile'
          }
          }
          stage ("maven package") {
            steps  {
              sh 'mvnw package'
          }
          }
          
          stage ("create docker image") {
            steps {
              sh 'docker build -t pratimadewde/spring_project:${BUILD_NUMBER} .'
          }
          }

          stage ("docker login") {
            steps {
                sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}'
            }
          }

          stage ("using ansible to deploy app ") {
            steps  {
              ansiblePlaybook credentialsId: 'ansicred', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'playbook.yml'
          }
          }
    }
    
}
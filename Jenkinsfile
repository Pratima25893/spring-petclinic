pipeline {
    agent any
    
    stages{
        stage {
          step ("git checkout") {
              git branch: 'main', changelog: false, poll: false, url: 'https://github.com/spring-projects/spring-petclinic.git'
          }
        
          step ("clean and compile") {
              sh 'mvnw clean compile'
          }
          
          step ("maven package") {
              sh 'mvnw package'
          }
          
          step ("create docker image") {
              sh 'docker build -t pratimadewde/spring_project:${BUILD_NUMBER} .'
          }
          
          step ("using ansible to deploy app ") {
              ansiblePlaybook credentialsId: 'ansicred', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'playbook.yml'
          }
          
    }
    
}
}
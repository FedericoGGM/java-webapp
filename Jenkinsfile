pipeline {

    agent any

    tools {
        maven 'Maven'
    }

    stages {
        stage ('start') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage ('deploy to tomcat') {
            steps {
              sh 'cp /var/jenkins_home/workspace/webapp-cicd/target/*.war /usr/local/tomcat/webapps/webapp.war'
            }
        }
    }
}
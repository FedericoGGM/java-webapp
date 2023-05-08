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
        
        stage('Change permissions') {
            steps {
                sh 'cp /var/jenkins_home/workspace/webapp-cicd/target/*.war /usr/local/tomcat/webapps/'
                sh 'chmod +x /usr/local/tomcat/webapps/webapp.war'
                sh 'ls -l /usr/local/tomcat/webapps/webapp.war'
            }
        }

        stage ('deploy to tomcat') {
            steps {
                script {
                    def warFile = sh(
                        script: 'ls /var/jenkins_home/workspace/webapp-cicd/target/*.war',
                        returnStdout: true
                    ).trim()
                    sh "cp $warFile /usr/local/tomcat/webapps/${JOB_NAME}.war"
                }
            }
        }

    } //  stages 
   
} //  pipeline
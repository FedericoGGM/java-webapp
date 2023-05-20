pipeline {

    agent any

    tools {
        maven 'Maven'
    }

    stages {
        stage ('start') {sta
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
        

    //     stage('Change permissions') {
    //         steps {
    //             sh 'cp /var/jenkins_home/workspace/webapp-cicd/target/*.war /usr/local/tomcat/webapps/'
    //             sh 'chmod +x /usr/local/tomcat/webapps/*.war'
    //             sh 'ls -l /usr/local/tomcat/webapps/*.war'
    //         }
    //     }

    //     stage ('deploy to tomcat') {
    //         steps {
    //             script {
    //                 def warFile = sh(
    //                     script: 'ls /var/jenkins_home/workspace/webapp-cicd/target/*.war',
    //                     returnStdout: true
    //                 ).trim()
    //                 // sh "cp $warFile /usr/local/tomcat/webapps/${JOB_NAME}.war"
    //                 sh "cp $warFile /usr/local/tomcat/webapps/Webapp.war"
    //             }
    //         }
        }


        stage ('Check-Git-Secrets') {
            steps {
               sh 'docker version'
               sh 'docker run gesellix/trufflehog --json https://github.com/joaco-sy/java-webapp.git > trufflehog_output'
               sh 'cat trufflehog_output'
            }
        }

        // stage () {
        //     steps {
        //         asd 

        //     }

        // }


    } //  stages 
   
} //  pipeline
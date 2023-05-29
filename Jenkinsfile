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


        stage ('Check-Git-Secrets') {
            steps {
               sh 'rm /jenkins/trufflehog_output || true'
               sh 'docker run --rm -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/joaco-sy/java-webapp.git --json >> /jenkins/trufflehog_output'
               sh 'cat /jenkins/trufflehog_output'
            }
        }      
       
        stage ('OWASP Dependency-Check Vulnerabilities') {
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o "./" 
                    -s "./"
                    -f "ALL" 
                    --prettyPrint''', odcInstallation: 'Dependency-owasp'
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }     
        }

    
        // stage ('SAST') {
        //     steps {
        //     withSonarQubeEnv('sonar') {
        //         sh 'mvn sonar:sonar'
        //         sh 'cat target/sonar/report-task.txt'
        //        }
        //     }
        // }


        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage ('Deploy-To-Tomcat') {
           steps {
           sshagent(['good']) {
                sh 'scp -o StrictHostKeyChecking=no target/*.war root@192.168.203.4:/opt/apache-tomcat-10.1.9/webapps/webapp.war'
                }      
            }       
        }


    } 
   
} 
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
               sh 'rm /tmp/trufflehog_output || true'
               sh 'docker run --rm -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/joaco-sy/java-webapp.git --json >> /tmp/trufflehog_output'
               sh 'cat /tmp/trufflehog_output'
            }
        }

    
        // stage ('Source Composition Analysis') {
        //   steps {
        //      sh 'rm owasp* || true'
        //      sh 'wget "https://raw.githubusercontent.com/joaco-sy/java-webapp/main/owasp-dependency-check.sh" '
        //      sh 'chmod +x owasp-dependency-check.sh'
        //      sh 'bash owasp-dependency-check.sh'
        //      sh 'cat /var/lib/jenkins/OWASP-Dependency-Check/reports/dependency-check-report.xml'
        //     }
        // }
        
       
        stage ('OWASP Dependency-Check Vulnerabilities') {
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o "./" 
                    -s "./"
                    -f "ALL" 
                    --prettyPrint''', odcInstallation: 'OWASP-DC'
                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
            }     
        }

        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }


    } 
   
} 
pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage ('Inicio') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}
                '''
            }
        }

        stage ('Deploy to tomcat') {
            steps {
                sshagent(['tomcat']) {
                    sh 'scp -o StrictHostKeyCheking=no target/*.war root@172.21.0.4:/tmp/apache-tomcat-8.5.38/webapps/'
                }
            }


        }

        // stage ('Build') {
        //     steps {
        //         sh 'mvn clean package'
                
        //     }
        // }
    }
}

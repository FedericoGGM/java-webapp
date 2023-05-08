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

    stages ('Deploy to tomcat container') {
        stage {
            sh 'docker exec tomcat /usr/local/tomcat/bin/shutdown.sh'
            sh 'docker cp /var/jenkins_home/workspace/webapp-cicd/target/WebApp.war tomcat:/usr/local/tomcat/webapps/'
            sh 'docker exec tomcat /usr/local/tomcat/bin/startup.sh'

        }
    }

        // stage ('Build') {
        //     steps {
        //         sh 'mvn clean package'
        //     }
        // }
    }
}
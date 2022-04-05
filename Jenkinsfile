pipeline {
    agent any
	
	  tools
    {
       maven "maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/devops4solutions/CI-CD-using-Docker.git'
             
          }
        }
	   stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
	 }
      stage('build && SonarQube analysis') {
          steps {
              withSonarQubeEnv('My SonarQube Server') {
                  // Optionally use a Maven environment you've configured already
                  withMaven(maven:'maven') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
 }
}

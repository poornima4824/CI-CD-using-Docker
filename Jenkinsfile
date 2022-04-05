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
      stage('Sonarqube'){
        steps {
          withSonarQubeEnv('sonar')
          {
            sh "mvn sonar:sonar"
          }
        }
      }
         stage("Quality gate check"){
           steps {
             timeout(time: 1, unit: 'HOURS')
             {
               waitForQualityGate abortPipeline: true
             }
           }
         }
 }
}

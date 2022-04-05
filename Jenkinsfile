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
  //     stage('SonarQube analysis') {
  //       steps {
  //   withSonarQubeEnv(credentialsId: 'f4248a8d33a0ef3ec6470c28be695ced18f8fab6', installationName: 'Sonar') { 
  //     sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
  //   }
  // }
  // }
  //        stage("Quality gate check"){
  //          steps {
  //            timeout(time: 1, unit: 'HOURS')
  //            {
  //              waitForQualityGate abortPipeline: true
  //            }
  //          }
  //        }

       stage('Nexus artifact upload') {
         steps {
         nexusArtifactUploader artifacts: [
           [
             artifactId: 'LoginWebApp', 
             classifier: '', 
             file: 'target/LoginWebApp-1.war', 
             type: 'war'
             ]
          ], 
             credentialsId: 'nexus', 
             groupId: 'com.devops4solutions', 
             nexusUrl: '52.55.151.18:8081', 
             nexusVersion: 'nexus3', 
             protocol: 'http', 
             repository: 'http://52.55.151.18:8081/repository/CI-CD-app/', 
             version: '1.0.0'
         }
       }
 }
}

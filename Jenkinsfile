pipeline {
  environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhubcredentials')     
  }    
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
       
        stage('Execute Sonarqube Report') {
        steps {
           withSonarQubeEnv('sonar')
           {
             sh "mvn sonar:sonar"
           }
          }
      }
      stage('Quality Gate Check') {
        steps {
           timeout(time: 1, unit: 'HOURS') 
           {    
              waitForQualityGate abortPipeline: true
      }
    }
     }

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
             repository: 'CI-CD-app', 
             version: '1.0.0'
         }
       }
        stage('Build Docker Image') {         
      steps{                
	         sh 'sudo -S docker build -t nagapoornima/sample_login_app:$BUILD_NUMBER .'           
           echo 'Build Image Completed'                
      }           
    }
    stage('Login to Docker Hub') {         
      steps{                            
	          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	          echo 'Login Completed'                
      }           
    }               
    stage('Push Image to Docker Hub') {         
      steps{                            
	        sh 'sudo docker push nagapoornima/sample_login_app:$BUILD_NUMBER'                 
          echo 'Push Image Completed'       
      }           
    }      
 }
}

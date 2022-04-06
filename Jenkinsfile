pipeline {
   environment
 {
     AWS_ACCOUNT_ID="440883647063"             
     AWS_DEFAULT_REGION="us-east-1" 
     IMAGE_REPO_NAME="sample_login_app"
     REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
	  DOCKERHUB_CREDENTIALS=credentials('docker')
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
       
    //     stage('Execute Sonarqube Report') {
    //     steps {
    //        withSonarQubeEnv('sonar')
    //        {
    //          sh "mvn sonar:sonar"
    //        }
    //       }
    //   }
    //   stage('Quality Gate Check') {
    //     steps {
    //        timeout(time: 1, unit: 'HOURS') 
    //        {    
    //           waitForQualityGate abortPipeline: true
    //   }
    // }
    //  }

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
        //  stage('Docker Build and Tag') {
        //       steps {
        //           sh 'docker build -t sample_login_app:latest .'
        //           sh 'docker tag  sample_login_app nagapoornima/sample_login_app:latest'
        //             }
        //       }
        //  stage('Login') {
        //       steps {
        //     sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        //         }
        //       }
        //   stage('Push') {
        //          steps {
        //           sh 'docker push  nagapoornima/sample_login_app:latest'

        //          }
        //    }
     
       stage('Login to AWS ECR')
      {
          steps
          {
              script
              {
                 sh "/usr/local/bin/aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                 // sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 440883647063.dkr.ecr.us-west-2.amazonaws.com"
              }
          }
      }
       stage('Building Docker Image')
       {
           steps
           {
               script
               {
                sh "docker build . -t ${REPOSITORY_URI}:mavenwebapp-${COMMIT}"
               }
           }
       }
       stage('Pushing Docker image into ECR')
       {
           steps
           {
             script
              {
                  sh "docker push ${REPOSITORY_URI}:mavenwebapp-${COMMIT}"
              }
           }

     }
  }
}

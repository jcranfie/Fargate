
pipeline
{
	agent any
    tools { 
        maven 'Maven-3.5.3'  
    }
    environment {
      PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/apache-maven-3.5.3/bin"
      AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
      AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
	  AWS_DEFAULT_REGION    = "eu-west-1"
    }
	stages
	{
		stage ('Build Stage')
		{
			steps
			{
				sh 'mvn -f BW/BusinessServices/APP.JMS.EMS.Demo.1.0.module.application.parent/pom.xml clean package initialize docker:build'
			}
		}
		stage ('Docker Login Stage')
		{
			steps
			{
				sh 'Jenkins/loginDockerAWS.sh'
			}
		}
		stage ('Push Stage')
		{
			steps
			{
				sh 'mvn -f BW/BusinessServices/APP.JMS.EMS.Demo.1.0.module.application.parent/pom.xml clean package initialize docker:push'
			}
		}
		stage ('Create Fargate Task Stage')
		{
			steps
			{
				sh 'AWSCLI/createTask.sh'
			}
		}
	}
}

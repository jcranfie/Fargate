
pipeline
{
	agent any
    tools { 
        maven 'Maven-3.5.3'  
    }
	stages
	{
		stage ('Prep Stage')
		{
			steps
			{
				sh 'export PATH=$PATH:/usr/local/bin;env'
			}
		}
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
	}
}

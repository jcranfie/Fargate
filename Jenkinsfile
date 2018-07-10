
pipeline
{
	agent any
    tools { 
        maven 'Maven-3.5.3'  
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
		stage ('Push Stage')
		{
			steps
			{
				sh 'mvn -f BW/BusinessServices/APP.JMS.EMS.Demo.1.0.module.application.parent/pom.xml clean package initialize docker:push'
			}
		}
	}
}

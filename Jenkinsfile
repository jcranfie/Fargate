
pipeline
{
	agent any
	stages
	{
		stage ('Build Stage')
		{
			withMaven(maven : 'Maven-3.5.3')
			{
				sh 'mvn -f test/bwce-ems-demo/BW/BusinessServices/APP.JMS.EMS.Demo.1.0.module.application.parent/pom.xml clean package initialize docker:build'
			}
		}
		stage ('Push Stage')
		{
			withMaven(maven : 'Maven-3.5.3')
			{
				sh 'mvn -f test/bwce-ems-demo/BW/BusinessServices/APP.JMS.EMS.Demo.1.0.module.application.parent/pom.xml clean package initialize docker:push'
			}
		}
	}
}

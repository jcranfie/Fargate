
aws ecs create-service --cluster testcluster --service-name AlertHubFargate-Service --task-definition AlertHub-fargate:5 --desired-count 2 --launch-type "FARGATE" --deployment-configuration "maximumPercent=200,minimumHealthyPercent=50"  --network-configuration "awsvpcConfiguration={subnets=[subnet-8ead62ea],securityGroups=[sg-5ee0f223],assignPublicIp=ENABLED}"


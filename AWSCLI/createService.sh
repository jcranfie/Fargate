
aws ecs create-service --cluster testcluster --service-name AlertHubFargate-Service --task-definition AlertHub-fargate:5 --desired-count 2 --launch-type "FARGATE" --deployment-configuration "maximumPercent=200,minimumHealthyPercent=50"  --network-configuration "awsvpcConfiguration={subnets=[subnet-8ead62ea],securityGroups=[sg-5ee0f223],assignPublicIp=ENABLED}"

aws application-autoscaling register-scalable-target --resource-id service/testcluster/AlertHubFargate-Service --service-namespace ecs --scalable-dimension ecs:service:DesiredCount --min-capacity 2 --max-capacity 20 --role-arn arn:aws:iam::675390051515:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService

aws application-autoscaling put-scaling-policy --cli-input-json file://./AWSCLI/put-scaling-policy-customer.json


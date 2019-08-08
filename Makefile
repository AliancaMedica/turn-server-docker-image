push:
	docker build -t turn-serer-staging .
	docker tag turn-server-staging:latest 120656099228.dkr.ecr.us-east-2.amazonaws.com/turn-server-staging:latest
	docker push 120656099228.dkr.ecr.us-east-2.amazonaws.com/turn-server-staging:latest
	docker rmi 120656099228.dkr.ecr.us-east-2.amazonaws.com/turn-server-staging:latest
update:
	aws ecs update-service --service turn-server-staging  --cluster am-ecs-cluster --force-new-deployment --region us-east-2
minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server
eval $(minikube docker-env)
# kubectl delete deploy nginx-deployment

kubectl apply -f ./srcs/configmap.yaml

eval $(minikube docker-env)
docker build -t nginx-image ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx.yaml

eval $(minikube docker-env)
docker build -t wp-image ./srcs/wordpress/

eval $(minikube docker-env)
docker build -t phpma-image ./srcs/phpmyadmin/

eval $(minikube docker-env)
docker build -t mysql-image ./srcs/mysql/

kubectl apply -f ./srcs/mysql/mysql.yaml


kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml


kubectl apply -f ./srcs/wordpress/wordpress.yaml

minikube dashboard &
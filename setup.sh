minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G
minikube addons enable dashboard
minikube addons enable metallb
eval $(minikube -p minikube docker-env)
# kubectl delete deploy nginx-deployment

kubectl apply -f ./srcs/configmap.yaml

docker build -t nginx-image ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t mysql-image ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql.yaml

minikube dashboard &
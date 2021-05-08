minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G
minikube addons enable dashboard
minikube addons enable metallb
eval $(minikube -p minikube docker-env)
# kubectl delete deploy nginx-deployment

kubectl apply -f configmap.yaml

docker build -t nginx-image ./nginx/
kubectl apply -f ./nginx/nginx.yaml

minikube dashboard &
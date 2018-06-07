#!/bin/bash/

echo "Please provide following details to create Kubernetes cluster"

read -p "Enter Compute Engine zone (default us-east1-b): " z_name
z_name=${z_name:-us-east1-b}
gcloud config set compute/zone $z_name

read -p "Enter Compute Engine network (default mynetwork): " net_name
net_name=${net_name:-mynetwork}
gcloud compute networks create $net_name

read -p "Enter Kubernetes Cluster name (default mycluster): " k8_name
k8_name=${k8_name:-mycluster}
gcloud container clusters create $k8_name --network $net_name --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"

echo "Getting the credentials for your cluster. Kubernetes Engine uses these credentials to access your newly provisioned cluster."
gcloud container clusters get-credentials $k8_name

echo "Cluster information"
kubectl cluster-info
kubectl get nodes

echo "To delete the cluster use below command"

echo "gcloud container clusters delete $k8_name"

echo "Once your work finished, delete the project to avoid incurring charges."

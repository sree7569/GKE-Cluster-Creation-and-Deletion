#!/bin/bash/

echo "Clusters available"
gcloud container clusters list

echo "Please provide following details to delete Kubernetes cluster"

read -p "Enter Compute Engine zone (default us-east1-b): " z_name
z_name=${z_name:-us-east1-b}
gcloud config set compute/zone $z_name

read -p "Enter Kubernetes Cluster name: " k8_name
gcloud container clusters delete $k8_name

read -p "Enter Compute Engine network: " net_name
gcloud compute networks delete $net_name

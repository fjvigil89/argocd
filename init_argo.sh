#!/bin/bash

# This script is used to initialize the Argo CD server and the Argo CD CLI
# It is used to create the initial admin user and to create the initial project
echo "#############################################"
echo "#######  Creating ArgoCD servers  #######"
echo "#############################################"

kustomize build ./argo-kube | kubectl apply -f -

echo "#############################################"
echo "#######  Apply proyects ArgoCD  #######"
echo "#############################################"

kubectl apply -f ./proyect_argocd

echo "#############################################"
echo "#######  User admin  #######"
echo "#######  Password ArgoCD  #######"
echo "#############################################"

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
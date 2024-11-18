#! /bin/bash

git clone https://github.com/NVIDIA/k8s-dra-driver.git
cd k8s-dra-driver

./demo/clusters/kind/create-cluster.sh

./demo/clusters/kind/build-dra-driver.sh

./demo/clusters/kind/install-dra-driver.sh

kubectl get pods -n nvidia

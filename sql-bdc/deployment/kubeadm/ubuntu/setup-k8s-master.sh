#!/bin/sh -x

# Initialize a kubernetes cluster on the current node.
#
KUBE_VERSION=1.15.0
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --kubernetes-version=$KUBE_VERSION
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
helm init
kubectl apply -f rbac.yaml
kubectl apply -f kubernetes-dashboard.yaml
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
kubeadm token create --print-join-command

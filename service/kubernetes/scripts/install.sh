#!/bin/sh
set -e

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb [arch=amd64] http://packages.cloud.google.com/apt kubernetes-xenial-unstable main
EOF
apt-get update || true
DEBIAN_FRONTEND=noninteractive apt-get install -yq docker.io -t unstable
DEBIAN_FRONTEND=noninteractive apt-get install -yq kubelet kubeadm kubectl kubernetes-cni

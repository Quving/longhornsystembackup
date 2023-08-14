#!/bin/bash

set -e

# Check if environment variable $KUBECONFIG is set
if [ -z "$KUBECONFIG_DATA" ]; then
  echo "Environment variable KUBECONFIG is not set. Exiting."
  exit 1
fi

# Check if environment variable $KUBERNETES_MANIFEST_DATA is set
if [ -z "$MANIFEST_DATA" ]; then
  echo "Environment variable KUBERNETES_MANIFEST_DATA is not set. Exiting."
  exit 1
fi

# Decode and write environment variable $KUBECONFIG to file
mkdir -p $HOME/.kube
echo "$KUBECONFIG_DATA" | base64 -d > $HOME/.kube/config

# Decode and write environment variable $MANIFEST_DATA to file
echo "$MANIFEST_DATA" | base64 -d > /tmp/k8s-manifest.yaml

# Invoke command
kubectl apply -f /tmp/k8s-manifest.yaml

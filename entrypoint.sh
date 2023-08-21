#!/bin/bash

set -e

FILE_TEMPLATE='longhornsystembackup.yaml.template'
FILE_MANIFEST='longhornsystembackup.yaml'

# Check if environment variable $KUBECONFIG is set
if [ -z "$KUBECONFIG_DATA" ]; then
  echo "Environment variable KUBECONFIG is not set. Exiting."
  exit 1
fi

# Decode and write environment variable $KUBECONFIG to file
mkdir -p $HOME/.kube
echo "$KUBECONFIG_DATA" | base64 -d > $HOME/.kube/config

# Replace variables in manifest
eval "echo \"$(cat $FILE_TEMPLATE)\"" > $FILE_MANIFEST

# Following manifest will be called
echo "Following manifest will be called:"
echo
cat $FILE_MANIFEST
echo

# Invoke command
kubectl apply -f $FILE_MANIFEST

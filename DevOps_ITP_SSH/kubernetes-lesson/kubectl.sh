#!/bin/bash
# Helper script for kubectl commands

export KUBECONFIG=~/.kube/config-k8s-prod

# Run kubectl with the correct config
kubectl --insecure-skip-tls-verify "$@"

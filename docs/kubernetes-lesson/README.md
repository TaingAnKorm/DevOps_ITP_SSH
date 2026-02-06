# Kubernetes Lesson

## 📚 Overview

Kubernetes cluster setup and management using Kubespray on Google Cloud Platform.

---

## 🎯 What Was Learned

### Cluster Architecture
- **Master Node** - Control plane (API server, scheduler, controller)
- **Worker Nodes** - Run application workloads
- **Network Plugin** - Calico for pod networking

### Core Concepts

#### Pods
- Smallest deployable unit
- Can contain one or more containers
- Share network and storage

#### Deployments
- Manage replica sets
- Rolling updates
- Rollback capability

#### Services
- Expose pods to network
- Types: ClusterIP, NodePort, LoadBalancer
- Service discovery

#### Namespaces
- Isolate resources
- Organize applications
- Apply resource quotas

#### Ingress
- HTTP/HTTPS routing
- Host-based and path-based routing
- SSL termination

---

## 🛠️ Tools Used

### kubectl
Kubernetes command-line tool for cluster management.

```bash
# Cluster info
kubectl cluster-info
kubectl get nodes

# Pods
kubectl get pods -A
kubectl describe pod <name>
kubectl logs <name>

# Deployments
kubectl get deployments
kubectl scale deployment <name> --replicas=3

# Services
kubectl get services
kubectl expose deployment <name> --port=80
```

### Kubespray
Ansible-based Kubernetes deployment tool.

```bash
# Deploy cluster
ansible-playbook -i inventory/prod/hosts.ini cluster.yml

# Add nodes
ansible-playbook -i inventory/prod/hosts.ini scale.yml

# Upgrade cluster
ansible-playbook -i inventory/prod/hosts.ini upgrade-cluster.yml
```

---

## 🚀 Cluster Setup

### Infrastructure
- **Platform:** Google Cloud Platform
- **VMs:** 3 instances (1 master, 2 workers)
- **OS:** Ubuntu 22.04 LTS
- **Network:** Calico CNI

### Installation Steps
1. Provision VMs on GCP
2. Configure SSH access
3. Set up Ansible inventory
4. Run Kubespray playbook
5. Configure kubectl locally

---

## 📦 Deployed Applications

### Kubernetes Dashboard
- Web UI for cluster management
- Namespace: `kubernetes-dashboard`
- Access: https://dashboard.taingan.store

### ArgoCD
- GitOps continuous delivery
- Namespace: `argocd`
- Access: https://argocd.taingan.store

### cert-manager
- SSL certificate automation
- Namespace: `cert-manager`
- Integrates with Let's Encrypt

### NGINX Ingress Controller
- HTTP/HTTPS routing
- Namespace: `ingress-nginx`
- Runs on worker nodes

---

## ✅ Best Practices Learned

1. **Master nodes don't run workloads** - Use taints and tolerations
2. **Use namespaces** - Organize and isolate applications
3. **Set resource limits** - Prevent resource exhaustion
4. **Use health checks** - Liveness and readiness probes
5. **Static IPs for production** - Avoid DNS issues
6. **HostNetwork for bare-metal** - When no LoadBalancer available
7. **GitOps for deployments** - Use ArgoCD for automation

---

## 🔍 Troubleshooting Commands

```bash
# Check node status
kubectl get nodes
kubectl describe node <name>

# Check pod issues
kubectl get pods -A
kubectl describe pod <name>
kubectl logs <name>

# Check events
kubectl get events --sort-by='.lastTimestamp'

# Check cluster components
kubectl get componentstatuses

# Debug networking
kubectl run -it --rm debug --image=busybox --restart=Never -- sh
```

---

**Cluster Details:**
- Kubernetes Version: v1.34.3
- Container Runtime: containerd 2.2.1
- Network Plugin: Calico
- Nodes: 3 (1 master, 2 workers)

**Last Updated:** February 6, 2026

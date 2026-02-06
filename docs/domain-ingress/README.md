# Domain Ingress with HTTPS

## 📚 Overview

Custom domain setup with HTTPS for Kubernetes applications using NGINX Ingress Controller and Let's Encrypt SSL certificates.

---

## 🎯 Configured Applications

1. **Kubernetes Dashboard** → `https://dashboard.taingan.store`
2. **ArgoCD** → `https://argocd.taingan.store`

---

## 📁 Project Structure

```
domain-ingress/
├── clusterissuer/
│   └── letsencrypt-prod.yaml      # Let's Encrypt ClusterIssuer
└── ingress/
    ├── dashboard-ingress.yaml      # Dashboard Ingress
    └── argocd-ingress.yaml         # ArgoCD Ingress
```

**Only 3 YAML files!** Simple and clean. 🚀

---

## 🔧 Components

### NGINX Ingress Controller
- Runs on worker node with HostNetwork mode
- Binds directly to ports 80/443
- Routes traffic based on hostname

### cert-manager
- Automates SSL certificate management
- Integrates with Let's Encrypt
- Handles certificate renewal (every 90 days)

### Let's Encrypt
- Free, valid SSL certificates
- HTTP-01 challenge validation
- Email notifications: `cleogg9999@gmail.com`

---

## 🚀 How It Works

1. **DNS** points domains to worker node IP (`34.158.41.16`)
2. **Ingress Controller** receives HTTPS traffic on port 443
3. **Ingress resources** route traffic to correct service
4. **cert-manager** automatically obtains SSL certificates
5. **Applications** serve traffic with valid HTTPS

---

## ✅ Key Learnings

1. **Use worker nodes** - Not master for application traffic
2. **HostNetwork required** - For bare-metal without LoadBalancer
3. **Let's Encrypt is free** - No need for self-signed certificates
4. **Simplicity wins** - 3 files vs 15+ in complex setups
5. **Static IPs essential** - Prevent DNS issues from VM restarts

---

## 🔐 Access

### Kubernetes Dashboard
- **URL:** https://dashboard.taingan.store
- **Auth:** Token-based
- **Get token:** `kubectl -n kubernetes-dashboard create token admin-user --duration=24h`

### ArgoCD
- **URL:** https://argocd.taingan.store
- **Username:** `admin`
- **Get password:** `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

---

**Infrastructure:**
- Platform: Google Cloud Platform
- Master: 34.87.37.15
- Worker1: 34.158.41.16 (used for DNS)
- Worker2: 34.142.237.14

**Last Updated:** February 6, 2026

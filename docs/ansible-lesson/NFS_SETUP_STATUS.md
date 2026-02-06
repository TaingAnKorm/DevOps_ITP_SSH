# NFS Setup Summary

## ✅ What's Complete

### NFS Server (This Machine - 34.142.203.158)
- ✅ NFS kernel server installed
- ✅ Shared directory created: `/srv/nfs_shared`
- ✅ NFS exports configured for worker IPs
- ✅ NFS service running

### Configuration Files Updated
- ✅ `inventory.ini` - Updated with current VM IPs
- ✅ `group_vars/all.yaml` - Updated with server IP and client IPs
- ✅ `nfs-client.yaml` - Fixed to use correct host group

## ❌ What's Pending

### NFS Clients (Kubernetes Workers)
- ❌ k8s-worker1 (34.142.165.79) - **VMs are stopped or unreachable**
- ❌ k8s-worker2 (34.126.85.133) - **VMs are stopped or unreachable**

## 📋 To Complete NFS Setup

### Option 1: Use Kubernetes VMs as NFS Clients

**If you want to use the K8s workers for NFS:**

1. **Start the VMs** from GCP Console:
   ```bash
   # Or use gcloud command:
   gcloud compute instances start k8s-worker1 k8s-worker2 --zone=asia-southeast1-b
   ```

2. **Wait 2 minutes** for VMs to boot

3. **Run NFS client installation**:
   ```bash
   cd /home/kta/DevOps_ITP_SSH/ansible-lesson/nfs
   ~/.local/bin/ansible-playbook -i inventory.ini playbooks/nfs-client.yaml
   ```

4. **Test NFS**:
   ```bash
   ~/.local/bin/ansible-playbook -i inventory.ini playbooks/test-nfs-sync.yaml
   ```

### Option 2: Create New VMs for NFS Lesson

**If you want separate VMs just for NFS:**

1. **Provision 2 new small VMs** (e2-micro to save costs):
   - Create a simple Ansible playbook to provision 2 VMs
   - Update `inventory.ini` with new IPs
   - Run NFS client installation

2. **Stop Kubernetes VMs** to save costs

## 🛠️ Current NFS Server Details

**Server IP**: 34.142.203.158  
**Shared Directory**: /srv/nfs_shared  
**Permissions**: 777 (nobody:nogroup)  
**Export Configuration**: `/etc/exports`
```
/srv/nfs_shared 34.142.165.79(rw,sync,no_subtree_check,no_root_squash) 34.126.85.133(rw,sync,no_subtree_check,no_root_squash)
```

## 📝 NFS Lesson Files

All files are ready in: `/home/kta/DevOps_ITP_SSH/ansible-lesson/nfs/`

- `inventory.ini` - Host definitions
- `playbooks/nfs-server.yaml` - Server setup (✅ completed)
- `playbooks/nfs-client.yaml` - Client setup (⏳ pending)
- `playbooks/test-nfs-sync.yaml` - Test NFS sync
- `playbooks/group_vars/all.yaml` - Configuration variables

## 💡 Recommendation

Since the Kubernetes cluster is already set up and working, I recommend:

1. **Keep the K8s VMs** for your Kubernetes lessons
2. **Create 2 new small VMs** (e2-micro) just for NFS practice
3. This way you can:
   - Practice NFS without affecting your K8s cluster
   - Save costs by stopping K8s VMs when not needed
   - Have dedicated resources for each lesson

Let me know which option you prefer!

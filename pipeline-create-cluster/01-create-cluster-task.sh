
#!/bin/sh
# 1. Login to Supervisor Cluster
# 2. Create TKC

# 1. Login to Supervisor Cluster
echo "\n\n$ Login to Tanzu Supervisor Cluster"
PW="VMware1!"
expect -c "
set timeout 5
spawn env LANG=C kubectl vsphere login --vsphere-username administrator@vsphere.local --server=https://172.17.187.129 --insecure-skip-tls-verify
expect \"Password:\"
send \"${PW}\n\"
expect \"$\"
exit 0
"

# 2. Create TKC
echo "\n\n$ cd resource-tanzu/tanzu_clusters"
cd resource-tanzu/tanzu-clusters
echo "\n\n$ Create Tanzu Kuberentes Cluster"
kubectl apply -f cluster-manifest-01.yaml

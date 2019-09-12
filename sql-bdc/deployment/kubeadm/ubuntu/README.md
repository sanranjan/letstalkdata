# Create a Kubernetes cluster using Kubeadm on Ubuntu 18.04 LTS

In this example, we will deploy Kubernetes over multiple Linux machines (physical or virtualized) using kubeadm utility. These instructions have been tested primarily with Ubuntu 16.04 LTS & 18.04 LTS versions.

## Pre-requisites

1. Multiple Ubuntu Linux machines or virtual machines. Recommended configuration is 8 CPUs, 64 GB memory each and at least 200 GB storage for each machine. Minimum number of machines required is three machines
1. Designate one machine as the Kubernetes master
1. Rest of the machines will be used as the Kubernetes agents

**NOTE: Ensure there is sufficient local storage on your agents. Each volume will use up to 10GB by default. The script creates 50 volumes. Not all of the volumes will be used since it depends on the number of pods being deployed on each agent node. It is recommended to have at least 200-300 GB of storage on the agent nodes**

### Instructions


1. Start a sudo shell context
1. Execute [setup-k8s-prereqs.sh](setup-k8s-prereqs.sh/) script on each machine
1. Execute [setup-k8s-master.sh](setup-k8s-master.sh/) script on the machine designated as Kubernetes master
1. After successful initialization of the Kubernetes master, follow the kubeadm join commands output by the setup script on each agent machine
1. Execute [setup-volumes-agent.sh](setup-volumes-agent.sh/) script on each agent machine to create volumes for local storage
1. Execute ***kubectl apply -f local-storage-provisioner.yaml*** against the Kubernetes cluster to create the local storage provisioner.
1. Now, you can deploy the SQL Server 2019 big data cluster following instructions [here](https://docs.microsoft.com/en-us/sql/big-data-cluster/deployment-guidance?view=sqlallproducts-allversions)

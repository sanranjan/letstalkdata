# Deploy SQL Server Big Data Clusters on Kubernetes

SQL Server big data cluster is deployed as docker containers on a Kubernetes cluster. This is an overview of the setup and configuration steps:

1. Set up a Kubernetes cluster on a single VM or cluster of VMs.
1. Install the cluster configuration tool azdata on your client machine.
1. Deploy a SQL Server big data cluster in a Kubernetes cluster.

## Install SQL Server 2019 big data tools

Before deploying a SQL Server 2019 big data cluster, first install the [big data tools](https://docs.microsoft.com/en-us/sql/big-data-cluster/deploy-big-data-tools?view=sqlallproducts-allversions) on your client machine:

azdata
kubectl
Azure Data Studio
SQL Server 2019 extension

## BDC Deployment

### Accept licence agreement

``` bash
azdata bdc create --accept-eula=yes
```
### Custom configuration

> Start with one of the standard deployment profiles that match your Kubernetes environment. You can use the azdata bdc config list command to list them:
```bash
azdata bdc config list
```
> create a copy of the deployment profile with the azdata bdc config init command. For example, the following command creates a copy of the kubeadm-dev-test deployment configuration files in a target directory named custom:
```bash
azdata bdc config init --source kubeadm-dev-test --target custom
```
> Customize your deployment by updating config jason. For example, the following command alters a custom deployment profile to change the name of the deployed cluster from the default (mssql-cluster) to sanbdc: 
```bash
azdata bdc config replace --config-file custom/bdc.json --json-values "metadata.name=sanbdc"
```
> Set Environment variables
```bash
export CONTROLLER_USERNAME=admin
export CONTROLLER_PASSWORD=<password>
export MSSQL_SA_PASSWORD=<password>
export KNOX_PASSWORD=<password>
```
> Start SQL Server Big Data Cluster Creation
```bash
azdata bdc create --config-profile custom --accept-eula yes
```


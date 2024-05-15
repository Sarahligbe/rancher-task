# rancher-task

This project uses Terraform to deploy ArgoCD on a K3s cluster deployed using Rancher on VirtualBox

## Repository structure
The **rancher/** directory contains the argocd configurations
The **helm-chart/** directory contains the bonus helm chart
The **terraform/** directory contains the terraform files to install argocd and apply the argocd configurations in the **rancher/** directory

## Pre-requisites
1. Two VirtualBox VMs
2. Rancher installed in the first VM
3. K3s cluster installed on the second VM using Rancher
4. Terraform installed on the second VM

## Running the project
1. clone the repository
2. cd into the **terraform/** directory and run
```bash
     terraform init
```
3. Run
```bash
     terraform plan
```
4. Run 
```bash
    terraform apply -auto-approve
```

**_Note:_** in the **terraform/providers.tf** file, you can change the path to your kubeconfig file

#!/bin/bash

# Variables
subscriptionId="83282bd3-3a4f-40b5-b38c-c279cccf992d"  # Replace with your subscription ID
resourceGroup="lab4p2"  # Replace with your resource group name
vmName="portainer-vm3"
location="westeurope"
publicIpAddressName="ipconfig1"

# Deploy VM using Azure CLI
az vm create \
  --resource-group ${resourceGroup} \
  --name ${vmName} \
  --location ${location} \
  --image Canonical:0001-com-ubuntu-server-focal:20_04-lts-gen2:latest \
  --admin-username azureuser \
  --size Standard_D2s_v3 \
  --public-ip-address ${publicIpAddressName} \
  --no-wait

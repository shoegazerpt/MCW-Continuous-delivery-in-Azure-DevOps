#!/bin/bash

curl -o studentfiles.zip https://cloudworkshop.blob.core.windows.net/agile-continous-delivery/studentfiles.zip
unzip studentfiles.zip

rgName=${1:-$(az group list --query [0].name -o tsv)}
templateUri=https://raw.githubusercontent.com/shoegazerpt/MCW-Continuous-delivery-in-Azure-DevOps/btf2020/Hands-on%20lab/deploy/azureDeploy.json

echo ""
echo "Provisioning test environment..."
az group deployment create --resource-group $rgName --template-uri $templateUri --parameters "{\"environment\":{\"value\":\"test\"}}" 

echo ""
echo "Provisioning production environment..."
az group deployment create --resource-group $rgName --template-uri $templateUri --parameters "{\"environment\":{\"value\":\"production\"}}" 
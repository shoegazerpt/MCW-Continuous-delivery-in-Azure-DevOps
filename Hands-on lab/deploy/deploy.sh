#!/bin/bash

curl -o studentfiles.zip https://cloudworkshop.blob.core.windows.net/agile-continous-delivery/studentfiles.zip
unzip studentfiles.zip

rgName=${1:-$(az group list --query [0].name -o tsv)}
rgLocation=${2:-$(az group list --query [0].location -o tsv)}
templateFile=https://raw.githubusercontent.com/shoegazerpt/MCW-Serverless-architecture/btf2020/Hands-on%20lab/deploy/azureDeploy.json

az group deployment create --resource-group $resourceGroupName --template-file "$HOME/studentfiles/armtemplate/azuredeploy.json"
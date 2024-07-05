subscription_id="83282bd3-3a4f-40b5-b38c-c279cccf992d"
resource_group="lab4p2"
location="westeurope"
public_ip_name="ipconfig1"

az network public-ip create \
    --subscription "${subscription_id}" \
    --resource-group "${resource_group}" \
    --name "${public_ip_name}" \
    --location "${location}" \
    --allocation-method Static \
    --sku Standard

#terraform import resourcetype.resourceblockname /resourceid
terraform import azurerm_resource_group.r-app-rg /subscriptions/3d50325d-5aa8-4fec-b449-8d3e59329142/resourceGroups/uat-app100-RG

terraform import azurerm_virtual_network.r-app-sh-vnet /subscriptions/3d50325d-5aa8-4fec-b449-8d3e59329142/resourceGroups/uat-app100-RG/providers/Microsoft.Network/virtualNetworks/sh-vnet-100

terraform import azurerm_subnet.r-app-subnet /subscriptions/3d50325d-5aa8-4fec-b449-8d3e59329142/resourceGroups/uat-app100-RG/providers/Microsoft.Network/virtualNetworks/sh-vnet-100/subnets/uat-sh-sn-100

#terraform plan will give update on planning
terraform plan 
terraform destroy --auto-approve

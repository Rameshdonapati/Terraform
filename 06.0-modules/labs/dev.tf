terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}


module "devmodule" {
    source = "./modules"
    rglocation = "East US"
    rgname = "app100-RG"
    prefix = "dev"
    virtual_network_name = "sh-vnet-200"
    virtual_subnet_name = "sh-sn-100"
    vnet_cidr = "10.10.0.0/16"
    subnet_cidr = "10.10.0.0/24"
}





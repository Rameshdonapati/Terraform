
#links:https://registry.terraform.io/providers/tfproviders/azurerm/latest/docs
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.112.0"
    }
  }
}

# Configure the Microsoft Azure Provider
#sourcelink: https://registry.terraform.io/providers/tfproviders/azurerm/latest/docs/guides/service_principal_client_secret

provider "azurerm" {
  features {}
  
  subscription_id = "3d50325d-5aa8-4fec-b449-8d3e59329142"
  client_id       = "e0af6d72-dcac-494a-afab-77f87b74f442"
  client_secret   = "Fyb8Q~uOCDBjjVXHT8l.QHLy.jD8gkKYGQOhMaaa"
  tenant_id       = "d66f66bc-c6b8-47a7-9128-f1f3fb74a468"
}

# Create a resource group
data "azurerm_resource_group" "r-app-rg" {
  name     = "braavos-Dev"
}

resource "azurerm_virtual_network" "r-app-sh-vnet" {
  name                = "${var.virtual_network_name}"
  location            = data.azurerm_resource_group.r-app-rg.location
  resource_group_name = data.azurerm_resource_group.r-app-rg.name
  address_space       = ["${var.vnet_cidr}"]
}

resource "azurerm_subnet" "r-app-subnet" {
  name                 = "${var.prefix}-${var.virtual_subnet_name}"
  resource_group_name  = data.azurerm_resource_group.r-app-rg.name
  virtual_network_name = azurerm_virtual_network.r-app-sh-vnet.name
  address_prefixes     = ["${var.subnet_cidr}"]
}
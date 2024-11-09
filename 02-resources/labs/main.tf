
#links:https://registry.terraform.io/providers/tfproviders/azurerm/latest/docs
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
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
resource "azurerm_resource_group" "r-app101-rg" {
  name     = "app101-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "r-app-sh-vnet" {
  name                = "app-sh-vnet"
  location            = azurerm_resource_group.r-app101-rg.location
  resource_group_name = azurerm_resource_group.r-app101-rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "r-app-sh-subnet" {
  name                 = "app-sh-subnet"
  resource_group_name  = azurerm_resource_group.r-app101-rg.name
  virtual_network_name = azurerm_virtual_network.r-app-sh-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

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

terraform {
  backend "azurerm" {
    resource_group_name  = "braavos-Dev"             # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "braavosstg"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "braavostfstate"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "gen.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    access_key           = "Y5t5Z8EnqP4M6TQcgl680daHl4aEtnOwfyHtRDEPuBEBoamRvZl7vyjokATaGwzzYW61pz1gZ2AG+AStRZuLxg=="  # Can also be set via `ARM_ACCESS_KEY` environment variable.
  }
}

# Create a resource group
resource "azurerm_resource_group" "r-app-rg" {
  name     = "${var.prefix}-${var.rgname}"
  location = "${var.rglocation}"
}

resource "azurerm_virtual_network" "r-app-sh-vnet" {
  name                = "${var.virtual_network_name}"
  location            = azurerm_resource_group.r-app-rg.location
  resource_group_name = azurerm_resource_group.r-app-rg.name
  address_space       = ["${var.vnet_cidr}"]
}

resource "azurerm_subnet" "r-app-subnet" {
  name                 = "${var.prefix}-${var.virtual_subnet_name}"
  resource_group_name  = azurerm_resource_group.r-app-rg.name
  virtual_network_name = azurerm_virtual_network.r-app-sh-vnet.name
  address_prefixes     = ["${var.subnet_cidr}"]
}


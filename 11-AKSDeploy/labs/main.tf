# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.67.0"
    }
  }
}

resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
  
  subscription_id = "3d50325d-5aa8-4fec-b449-8d3e59329142"
  client_id       = "${var.appId}"
  client_secret   = "${var.password}"
  tenant_id       = "d66f66bc-c6b8-47a7-9128-f1f3fb74a468"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "BraavosRG" {
  name     = "${random_pet.prefix.id}-rg"
  location = "West US 2"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "Braavosk8s" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.BraavosRG.location
  resource_group_name = azurerm_resource_group.BraavosRG.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"
  kubernetes_version  = "1.31.1"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }
  role_based_access_control_enabled = true
 service_principal {
   client_id = "${var.appId}"
   client_secret = "${var.password}"
 }
  tags = {
    environment = "Demo"
  }
  depends_on = [ azurerm_resource_group.BraavosRG ]
}

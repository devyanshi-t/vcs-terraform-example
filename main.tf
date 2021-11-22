terraform {

     backend "remote" {
    organization = "demoDT"

    workspaces {
      name = "vcs-terraform-example"
    }
  }
}


provider "azurerm" {
  features {}
}

module "cloudinit-example" {
  source  = "devyanshi-t/cloudinit-example/azure"
  version = "1.0.0"
  location=var.location
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "acctest-01"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}


output "pip" {
    value = module.cloudinit-example.public_ip
}
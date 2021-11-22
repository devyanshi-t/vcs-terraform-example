terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}


provider "azurerm" {
  features {}
}

module "cloudinit-example" {
  source  = "devyanshi-t/cloudinit-example/azure"
  version = "1.0.0"
  location="eastus"
}
output "pip" {
    value = module.cloudinit-example.public_ip
}
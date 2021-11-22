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
output "pip" {
    value = module.cloudinit-example.public_ip
}
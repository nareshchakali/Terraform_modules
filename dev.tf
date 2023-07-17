terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.1"
    }

  }
}

module "module_dev" {
    source = "./modules"
    prefix = "dev"
    vnet_cidr_prefix = "10.20.0.0/16"
    sub1_cidr_prefix = "10.20.1.0/24"
    rgname = "DevRG"
    rglocation = "eastus"
  
}
/*terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.46.0"
    }
  }
}*/

module "module_uat" {
    source = "./modules"
    prefix = "uat"
    vnet_cidr_prefix = "10.60.0.0/16"
    sub1_cidr_prefix = "10.60.1.0/24"
    rgname = "UatRG"
    rglocation = "eastus"
}
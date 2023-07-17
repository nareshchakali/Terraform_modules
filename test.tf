/*terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.46.0"
    }
  }
}*/

module "module_test" {
    source = "./modules"
    prefix = "test"
    vnet_cidr_prefix = "10.70.0.0/16"
    sub1_cidr_prefix = "10.70.1.0/24"
    rgname = "TestRG"
    rglocation = "eastus"
}
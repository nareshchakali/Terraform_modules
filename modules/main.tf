terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

# 2. Configure the AzureRM Provider
provider "azurerm" {
  features {}
  subscription_id = "11e07d93-b7de-44c1-b006-7218b5fb3180"
  client_id       = "b30bfd9a-8e64-4c5a-ac79-c166d9ae713c"
  client_secret   = "mit8Q~qmWXTwifGCRrGggw0m97aJnXNLHwVdTaaZ"
  tenant_id       = "30bf9f37-d550-4878-9494-1041656caf27"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.rgname}"
  location = "${var.rglocation}"
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "${var.prefix}-10"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["${var.vnet_cidr_prefix}"]
}
resource "azurerm_subnet" "sub1" {
  name                 = "${var.prefix}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet1.name}"
  address_prefixes     = ["${var.sub1_cidr_prefix}"]
}

resource "azurerm_network_security_group" "nsg1" {
    name               = "${var.prefix}-nsg1"
    location            = "${azurerm_resource_group.rg.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
}
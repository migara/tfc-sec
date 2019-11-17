resource "azurerm_resource_group" "test" {
  name     = "migara_tfc_sec"
  location = "North Europe"

  tags = {
    environment = "TFC"
  }
}

resource "azurerm_resource_group" "test22" {
  name     = "migara_tfc_sec_dev"
  location = "North Europe"

  tags = {
    environment = "TFC"
  }
}

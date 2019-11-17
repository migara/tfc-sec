resource "azurerm_resource_group" "test" {
  name     = "migara_tfc_sec"
  location = "North Europe"

  tags = {
    environment = "TFC"
  }
}

provider "panos" {
  hostname = "40.85.87.187"
}

locals {
  sec_rules = yamldecode(file("./firewall_rules.yml")).security_policy_rules
}

resource "panos_panorama_security_policy" "example" {

  dynamic "rule" {
    for_each = local.sec_rules

    content {
      name                  = rule.value.name
      source_zones          = rule.value.source_zones
      source_addresses      = rule.value.source_addresses
      source_users          = rule.value.source_users
      hip_profiles          = rule.value.hip_profiles
      destination_zones     = rule.value.destination_zones
      destination_addresses = rule.value.destination_addresses
      applications          = rule.value.applications
      services              = rule.value.services
      categories            = rule.value.categories
      action                = rule.value.action
    }
  }

  # rule {
  #   name                  = "allow bizdev to dmz"
  #   source_zones          = ["bizdev"]
  #   source_addresses      = ["any"]
  #   source_users          = ["any"]
  #   hip_profiles          = ["any"]
  #   destination_zones     = ["dmz"]
  #   destination_addresses = ["any"]
  #   applications          = ["any"]
  #   services              = ["application-default"]
  #   categories            = ["any"]
  #   action                = "allow"
  # }

  # rule {
  #   name                  = "deny sales to eng"
  #   source_zones          = ["sales"]
  #   source_addresses      = ["any"]
  #   source_users          = ["any"]
  #   hip_profiles          = ["any"]
  #   destination_zones     = ["eng"]
  #   destination_addresses = ["any"]
  #   applications          = ["any"]
  #   services              = ["application-default"]
  #   categories            = ["any"]
  #   action                = "deny"
  # }
}

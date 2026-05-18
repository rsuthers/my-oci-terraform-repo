output "environments_compartment_ocid" {
  description = "OCID of the Environments parent compartment."
  value       = module.compartments.environments_compartment_ocid
}

output "environment_compartment_ocids" {
  description = "OCIDs of Production, UAT, NonProd, and Sandpit."
  value       = module.compartments.environment_compartment_ocids
}

output "environment_child_compartment_ocids" {
  description = "Nested map of child compartment OCIDs by environment and tier."
  value       = module.compartments.environment_child_compartment_ocids
}

output "nonprod_compartment_ocid" {
  description = "OCID of Environments / NonProd."
  value       = module.compartments.nonprod_compartment_ocid
}

output "nonprod_child_compartment_ocids" {
  description = "Child compartment OCIDs under Environments / NonProd."
  value       = module.compartments.nonprod_child_compartment_ocids
}

output "nonprod_network_compartment_ocid" {
  description = "OCID of Environments / NonProd / Network. Use this as input to the 10-network-nonprod stack."
  value       = module.compartments.nonprod_network_compartment_ocid
}

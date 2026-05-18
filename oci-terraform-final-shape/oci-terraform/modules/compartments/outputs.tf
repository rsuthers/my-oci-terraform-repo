output "environments_compartment_ocid" {
  description = "OCID of the Environments parent compartment."
  value       = oci_identity_compartment.environments.id
}

output "environment_compartment_ocids" {
  description = "OCIDs of the environment parent compartments."
  value = {
    for name, compartment in oci_identity_compartment.environment :
    name => compartment.id
  }
}

output "environment_child_compartment_ocids" {
  description = "Nested map of child compartment OCIDs by environment and tier."
  value = {
    for env in local.environments :
    env => {
      for child in local.child_compartments :
      child => oci_identity_compartment.environment_child["${env}-${child}"].id
    }
  }
}

output "nonprod_compartment_ocid" {
  description = "OCID of the NonProd environment compartment."
  value       = oci_identity_compartment.environment["NonProd"].id
}

output "nonprod_child_compartment_ocids" {
  description = "Child compartment OCIDs under NonProd."
  value = {
    for child in local.child_compartments :
    child => oci_identity_compartment.environment_child["NonProd-${child}"].id
  }
}

output "nonprod_network_compartment_ocid" {
  description = "OCID of Environments / NonProd / Network."
  value       = oci_identity_compartment.environment_child["NonProd-Network"].id
}

locals {
  environments = toset([
    "Production",
    "UAT",
    "NonProd",
    "Sandpit"
  ])

  child_compartments = toset([
    "Network",
    "Application",
    "Database",
    "Storage",
    "Integration"
  ])

  environment_children = flatten([
    for env in local.environments : [
      for child in local.child_compartments : {
        key         = "${env}-${child}"
        environment = env
        child_name  = child
      }
    ]
  ])

  common_tags = merge(var.freeform_tags, {
    ManagedBy = "Terraform"
  })
}

resource "oci_identity_compartment" "environments" {
  compartment_id = var.tenancy_ocid
  name           = "Environments"
  description    = "Parent compartment for environment-specific resources."

  enable_delete = var.enable_compartment_delete
  freeform_tags = local.common_tags
}

resource "oci_identity_compartment" "environment" {
  for_each = local.environments

  compartment_id = oci_identity_compartment.environments.id
  name           = each.key
  description    = "${each.key} environment compartment."

  enable_delete = var.enable_compartment_delete
  freeform_tags = merge(local.common_tags, {
    Environment = each.key
  })
}

resource "oci_identity_compartment" "environment_child" {
  for_each = {
    for item in local.environment_children : item.key => item
  }

  compartment_id = oci_identity_compartment.environment[each.value.environment].id
  name           = each.value.child_name
  description    = "${each.value.environment} ${each.value.child_name} compartment."

  enable_delete = var.enable_compartment_delete
  freeform_tags = merge(local.common_tags, {
    Environment = each.value.environment
    Tier        = each.value.child_name
  })
}

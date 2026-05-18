locals {
  vcn_display_name = "VCN-${var.region_name}-${var.environment}"

  # OCI DNS labels must be alphanumeric and begin with a letter.
  # For this model, this resolves to vcnlonnonprod.
  vcn_dns_label = lower("vcn${var.region_name}${var.environment}")

  subnet_display_names = {
    for tier, cidr in var.subnet_cidr_blocks :
    tier => "SN-VCN-${var.region_name}-${var.environment}-${tier}"
  }

  common_tags = merge(var.freeform_tags, {
    ManagedBy   = "Terraform"
    Environment = var.environment
  })
}

resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_ocid
  cidr_blocks    = var.vcn_cidr_blocks
  display_name   = local.vcn_display_name
  dns_label      = local.vcn_dns_label

  freeform_tags = merge(local.common_tags, {
    Name = local.vcn_display_name
  })
}

resource "oci_core_subnet" "this" {
  for_each = var.subnet_cidr_blocks

  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.this.id
  cidr_block                 = each.value
  display_name               = local.subnet_display_names[each.key]
  dns_label                  = lookup(var.subnet_dns_labels, each.key, lower(substr(each.key, 0, 15)))
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic

  freeform_tags = merge(local.common_tags, {
    Name = local.subnet_display_names[each.key]
    Tier = each.key
  })
}

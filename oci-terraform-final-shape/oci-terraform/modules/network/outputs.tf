output "vcn_ocid" {
  description = "OCID of the VCN."
  value       = oci_core_vcn.this.id
}

output "vcn_display_name" {
  description = "Display name of the VCN."
  value       = oci_core_vcn.this.display_name
}

output "vcn_cidr_blocks" {
  description = "CIDR blocks assigned to the VCN."
  value       = oci_core_vcn.this.cidr_blocks
}

output "default_route_table_id" {
  description = "Default route table OCID created with the VCN."
  value       = oci_core_vcn.this.default_route_table_id
}

output "default_security_list_id" {
  description = "Default security list OCID created with the VCN."
  value       = oci_core_vcn.this.default_security_list_id
}

output "default_dhcp_options_id" {
  description = "Default DHCP options OCID created with the VCN."
  value       = oci_core_vcn.this.default_dhcp_options_id
}

output "subnet_ocids" {
  description = "Map of subnet OCIDs by tier."
  value = {
    for tier, subnet in oci_core_subnet.this :
    tier => subnet.id
  }
}

output "subnet_cidr_blocks" {
  description = "Map of subnet CIDR blocks by tier."
  value = {
    for tier, subnet in oci_core_subnet.this :
    tier => subnet.cidr_block
  }
}

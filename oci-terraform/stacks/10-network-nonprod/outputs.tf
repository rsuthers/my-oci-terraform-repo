output "vcn_ocid" {
  description = "OCID of VCN-LON-NonProd."
  value       = module.network.vcn_ocid
}

output "vcn_display_name" {
  description = "Display name of the NonProd VCN."
  value       = module.network.vcn_display_name
}

output "vcn_cidr_blocks" {
  description = "CIDR blocks assigned to VCN-LON-NonProd."
  value       = module.network.vcn_cidr_blocks
}

output "subnet_ocids" {
  description = "Map of NonProd subnet OCIDs by tier. Use these as inputs to Dev/Test workload stacks."
  value       = module.network.subnet_ocids
}

output "subnet_cidr_blocks" {
  description = "Map of NonProd subnet CIDR blocks by tier."
  value       = module.network.subnet_cidr_blocks
}

output "default_route_table_id" {
  description = "Default route table OCID created with VCN-LON-NonProd."
  value       = module.network.default_route_table_id
}

output "default_security_list_id" {
  description = "Default security list OCID created with VCN-LON-NonProd."
  value       = module.network.default_security_list_id
}

output "default_dhcp_options_id" {
  description = "Default DHCP options OCID created with VCN-LON-NonProd."
  value       = module.network.default_dhcp_options_id
}

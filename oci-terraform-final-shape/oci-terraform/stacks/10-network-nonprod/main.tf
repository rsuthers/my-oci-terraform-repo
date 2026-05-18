module "network" {
  source = "../../modules/network"

  compartment_ocid = var.nonprod_network_compartment_ocid

  region_name = "LON"
  environment = "NonProd"

  vcn_cidr_blocks             = var.vcn_cidr_blocks
  subnet_cidr_blocks          = var.subnet_cidr_blocks
  prohibit_public_ip_on_vnic  = var.prohibit_public_ip_on_vnic
  freeform_tags               = var.freeform_tags
}

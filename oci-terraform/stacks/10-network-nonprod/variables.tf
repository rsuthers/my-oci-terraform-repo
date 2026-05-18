variable "region" {
  description = "OCI region for Resource Manager execution."
  type        = string
  default     = "uk-london-1"
}

variable "nonprod_network_compartment_ocid" {
  description = "OCID of Environments / NonProd / Network from the 00-compartments stack output."
  type        = string
}

variable "vcn_cidr_blocks" {
  description = "CIDR blocks for VCN-LON-NonProd."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for the NonProd tier subnets."
  type        = map(string)
  default = {
    Application = "10.20.10.0/24"
    Database    = "10.20.20.0/24"
    Storage     = "10.20.30.0/24"
    Integration = "10.20.40.0/24"
  }
}

variable "prohibit_public_ip_on_vnic" {
  description = "Whether VNICs in the subnets are prevented from having public IPs."
  type        = bool
  default     = true
}

variable "freeform_tags" {
  description = "Freeform tags applied to NonProd network resources."
  type        = map(string)
  default     = {}
}

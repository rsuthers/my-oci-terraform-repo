variable "compartment_ocid" {
  description = "OCID of the compartment where the VCN and subnets will be created."
  type        = string
}

variable "region_name" {
  description = "Short region code used in resource names, for example LON."
  type        = string
}

variable "environment" {
  description = "Environment name used in resource names, for example NonProd."
  type        = string
}

variable "vcn_cidr_blocks" {
  description = "CIDR blocks for the VCN."
  type        = list(string)
}

variable "subnet_cidr_blocks" {
  description = "Map of subnet tier name to CIDR block."
  type        = map(string)
}

variable "subnet_dns_labels" {
  description = "Map of subnet tier name to OCI DNS label. DNS labels must be alphanumeric and unique within the VCN."
  type        = map(string)
  default = {
    Application = "app"
    Database    = "db"
    Storage     = "stg"
    Integration = "int"
  }
}

variable "prohibit_public_ip_on_vnic" {
  description = "Whether VNICs in the subnets are prevented from having public IPs."
  type        = bool
  default     = true
}

variable "freeform_tags" {
  description = "Freeform tags applied to network resources."
  type        = map(string)
  default     = {}
}

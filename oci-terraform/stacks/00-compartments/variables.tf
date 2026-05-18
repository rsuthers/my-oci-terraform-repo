variable "tenancy_ocid" {
  description = "The OCID of the root tenancy."
  type        = string
}

variable "region" {
  description = "OCI region for Resource Manager execution, for example uk-london-1."
  type        = string
  default     = "uk-london-1"
}

variable "enable_compartment_delete" {
  description = "Allow compartments to be deleted by Terraform destroy. Keep false for foundation compartments."
  type        = bool
  default     = false
}

variable "freeform_tags" {
  description = "Freeform tags applied to all compartments."
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "OCI region for Resource Manager execution."
  type        = string
  default     = "uk-london-1"
}

variable "nonprod_child_compartment_ocids" {
  description = "NonProd child compartment OCIDs from the 00-compartments stack output."
  type = object({
    Application = string
    Database    = string
    Storage     = string
    Integration = string
    Network     = string
  })
}

variable "nonprod_subnet_ocids" {
  description = "NonProd subnet OCIDs from the 10-network-nonprod stack output."
  type = object({
    Application = string
    Database    = string
    Storage     = string
    Integration = string
  })
}

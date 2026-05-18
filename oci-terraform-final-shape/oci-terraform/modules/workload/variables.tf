variable "environment_name" {
  description = "Workload deployment name, for example Dev or Test."
  type        = string
}

variable "compartment_ocids" {
  description = "NonProd child compartment OCIDs by tier."
  type = object({
    Application = string
    Database    = string
    Storage     = string
    Integration = string
    Network     = string
  })
}

variable "subnet_ocids" {
  description = "NonProd subnet OCIDs by tier."
  type = object({
    Application = string
    Database    = string
    Storage     = string
    Integration = string
  })
}

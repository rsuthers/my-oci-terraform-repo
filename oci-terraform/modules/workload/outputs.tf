output "workload_context" {
  description = "Resolved workload context for future resources."
  value = {
    environment_name = var.environment_name
    compartment_ocids = var.compartment_ocids
    subnet_ocids      = var.subnet_ocids
  }
}

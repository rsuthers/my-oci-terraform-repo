module "dev_workloads" {
  source = "../../modules/workload"

  environment_name  = "Dev"
  compartment_ocids = var.nonprod_child_compartment_ocids
  subnet_ocids      = var.nonprod_subnet_ocids
}

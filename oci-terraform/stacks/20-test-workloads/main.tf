module "test_workloads" {
  source = "../../modules/workload"

  environment_name  = "Test"
  compartment_ocids = var.nonprod_child_compartment_ocids
  subnet_ocids      = var.nonprod_subnet_ocids
}

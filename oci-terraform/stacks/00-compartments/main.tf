module "compartments" {
  source = "../../modules/compartments"

  tenancy_ocid              = var.tenancy_ocid
  enable_compartment_delete = var.enable_compartment_delete
  freeform_tags             = var.freeform_tags
}

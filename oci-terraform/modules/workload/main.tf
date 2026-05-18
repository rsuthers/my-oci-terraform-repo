# Placeholder module for future workload resources.
#
# Dev and Test workload stacks will deploy resources into the shared NonProd
# tier compartments and attach to the shared NonProd subnets.
#
# Example future placements:
# - compute/application resources -> compartment_ocids.Application + subnet_ocids.Application
# - database resources            -> compartment_ocids.Database    + subnet_ocids.Database
# - storage resources             -> compartment_ocids.Storage
# - integration resources         -> compartment_ocids.Integration + subnet_ocids.Integration

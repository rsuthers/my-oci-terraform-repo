# OCI Terraform Resource Manager Repo

This repo is structured for OCI Resource Manager Git-backed stacks.

## Final compartment model

```text
Environments
├── Production
│   ├── Network
│   ├── Application
│   ├── Database
│   ├── Storage
│   └── Integration
├── UAT
│   ├── Network
│   ├── Application
│   ├── Database
│   ├── Storage
│   └── Integration
├── NonProd
│   ├── Network
│   ├── Application
│   ├── Database
│   ├── Storage
│   └── Integration
└── Sandpit
    ├── Network
    ├── Application
    ├── Database
    ├── Storage
    └── Integration
```

## Resource Manager stacks

| Stack | Working directory | Purpose |
|---|---|---|
| 00-compartments | stacks/00-compartments | Creates the full compartment hierarchy |
| 10-network-nonprod | stacks/10-network-nonprod | Creates VCN-LON-NonProd and the associated subnets |
| 20-dev-workloads | stacks/20-dev-workloads | Placeholder for Dev workload resources using NonProd compartments/network |
| 20-test-workloads | stacks/20-test-workloads | Placeholder for Test workload resources using NonProd compartments/network |

## Deployment order

1. Apply `00-compartments`.
2. Copy the `nonprod_network_compartment_ocid` output into the `10-network-nonprod` stack variable.
3. Apply `10-network-nonprod`.
4. Copy `nonprod_child_compartment_ocids` and `subnet_ocids` into Dev/Test workload stacks when you are ready to build workloads.

## Notes

- The OCI provider block only sets `region`, which is the Resource Manager-friendly pattern.
- Do not commit Terraform state files, local `.tfvars`, or `.terraform/` directories.
- The NonProd subnets are private regional subnets by default.

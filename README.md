## Virtual Application Terraform Module

This Terraform module will deploy Virtual Applications (vApps) into an existing VMware Cloud Director (VCD) Environment.  This module can be used to provision new vApps into [Rackspace Technology SDDC Flex](https://www.rackspace.com/cloud/private/software-defined-data-center-flex) VCD Data Center Regions.

## Requirements

| Name      | Version |
|-----------|---------|
| terraform | ~> 1.2  |
| vcd       | ~> 3.8 |

## Resources

| Name                                                             | Type      |
|------------------------------------------------------------------|-----------|
| [vcd_vdc_group](https://registry.terraform.io/providers/vmware/vcd/3.8.2/docs/data-sources/vdc_group) | data source |
| [vcd_vapp](https://registry.terraform.io/providers/vmware/vcd/3.8.2/docs/resources/vapp) | resource   |

## Inputs

| Name                          | Description                                                          | Type   | Default           | Required |
|-------------------------------|----------------------------------------------------------------------|--------|-------------------|----------|
| vdc_org_name | The name of the Data Center Group Organization in VCD | string | `"Organization Name Format: <Account_Number>-<Region>-<Account_Name>"` | yes |
| vdc_group_name | The name of the Data Center Group in VCD | string | `"Data Center Group Name Format: <Account_Number>-<Region>-<Account_Name> <datacenter group>"` | yes |
| vdc_name | Cloud Director VDC Name | string | `"Virtual Data Center Name Format: <Account_Number>-<Region>-<Segment Name>"` | Yes |
| vapp_names | The names of the vApps to be created | list | - | Yes |
| power_on | The boolean value stating if this vApp should be powered on | bool | - | No |

## Outputs

| Name         | Description             |
|--------------|-------------------------|
| vapp_names | The names of the Virtual Applications (vApps) |

## Example Usage

This is an example of a `main.tf` file that uses the `"github.com/global-vmware/vcd_vapp_vm"` Module source to create vApps in a VMware Cloud Director environment:

```terraform
module "vcd_vapp" {
  source                = "github.com/global-vmware/vcd_vapp.git?ref=v1.2.1"
  
  vdc_org_name          = "<US1-VDC-ORG-NAME>"
  vdc_group_name        = "<US1-VDC-GRP-NAME>"
  vdc_name              = "<US1-VDC-NAME>"

  vapp_names = [
    "My Production vApp-01",
    "My Production vApp-02"
  ]
}
```

## Authors

This module is maintained by the [Global VMware Cloud Automation Services Team](https://github.com/global-vmware).

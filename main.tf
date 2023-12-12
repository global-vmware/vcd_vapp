terraform {
  required_version = "~> 1.2"

  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "~> 3.8"
    }
  }
}

data "vcd_vdc_group" "vdc_group" {
  org       = var.vdc_org_name
  name      = var.vdc_group_name
}

resource "vcd_vapp" "vapp" {
  for_each  = { for name in var.vapp_names: name => {} }
  org       = var.vdc_org_name
  name      = each.key
  vdc       = var.vdc_name
  power_on  = var.power_on
}

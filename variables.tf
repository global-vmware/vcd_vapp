variable "vdc_org_name" {}

variable "vdc_group_name" {}

variable "vdc_name" {}

variable "vapp_names" {
  type    = list(string)
}

variable "power_on" {
  type    = bool
  default = true
}
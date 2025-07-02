output "vapp_names" {
  value = [for v in vcd_vapp.vapp : v.name]
}

module "for_rg" {
  source         = "../../moduals/azurerm_resource_group"
  resource_group = var.resource_group
}
module "for_vnet" {
  depends_on = [module.for_rg]
  source     = "../../moduals/azurerm_virtual_network"
  vnet       = var.vnet
}
module "for_subnet" {
  depends_on = [module.for_vnet]
  source     = "../../moduals/azurerm_subnet"
  subnet     = var.subnet
}
module "for_public_ip" {
  depends_on = [module.for_rg]
  source     = "../../moduals/azrerm_public_ip"
  public_ip  = var.public_ip
}
module "for_nic" {
  depends_on        = [module.for_rg, module.for_subnet, module.for_public_ip]
  source            = "../../moduals/azurerm_nic"
  network_interface = var.network_interface
}
module "for_vm" {
  depends_on = [module.for_rg, module.for_nic]
  source     = "../../moduals/azurerm_vm"
  vm         = var.vm

}
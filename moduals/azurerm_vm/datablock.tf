data "azurerm_network_interface" "tcsnic" {
    for_each = var.vm
  name                = each.value.data_nic_name
  resource_group_name = each.value.resource_group_name
}
resource_group = {
  car = {
    name     = "carrg"
    location = "centralindia"
  }
  bike = {
    name     = "bikerg"
    location = "westus"
  }
   cycle = {
    name     = "cyclerg"
    location = "westus"
  }
   ship = {
    name     = "shiprg"
    location = "westus"  
  }
   laptop = {
    name     = "laptop"
    location = "centralindia"  
  }
}
vnet = {
  vm01 = {
    name                = "vnet01"
    location            = "centralindia"
    resource_group_name = "carrg"
    address_space       = ["10.143.0.0/16"]
  }
  vm02 = {
    name                = "vnet02"
    location            = "westus"
    resource_group_name = "bikerg"
    address_space       = ["10.145.0.0/16"]
  }
}
subnet = {
  sub01 = {
    name                 = "sbunet01"
    resource_group_name  = "carrg"
    virtual_network_name = "vnet01"
    address_prefixes     = ["10.143.8.0/24"]
  }
  sub02 = {
    name                 = "sbunet02"
    resource_group_name  = "carrg"
    virtual_network_name = "vnet01"
    address_prefixes     = ["10.143.9.0/24"]
  }
}
network_interface = {
  carnic = {
    name                          = "carnic1"
    location                      = "centralindia"
    resource_group_name           = "carrg"
    ip_name                       = "carpip"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "sbunet01"
    vnet_name                     = "vnet01"
    rg_name                       = "carrg"
    public_ip_name                = "pip01"


  }
  bikenic = {
    name                          = "bikenic1"
    location                      = "centralindia"
    resource_group_name           = "carrg"
    ip_name                       = "bikeip"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "sbunet02"
    vnet_name                     = "vnet01"
    rg_name                       = "carrg"
    public_ip_name                = "pip02"

  }
}
public_ip = {
  pip05 = {
    name                = "pip01"
    resource_group_name = "carrg"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip07 = {
    name                = "pip02"
    resource_group_name = "carrg"
    location            = "centralindia"
    allocation_method   = "Static"
  }

}
vm = {
  vm01 = {
    vm_name                         = "tcs-machine"
    resource_group_name             = "carrg"
    location                        = "centralindia"
    size                            = "Standard_D2as_v5"
    admin_username                  = "tcsadmin"
    admin_password                  = "tcs@12345"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    data_nic_name                   = "carnic1"
    disable_password_authentication = false
  }
  vm02 = {
    vm_name                         = "tcs-machine01"
    resource_group_name             = "carrg"
    location                        = "centralindia"
    size                            = "Standard_D2as_v5"
    admin_username                  = "tcsadmin"
    admin_password                  = "tcs@123456"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
    data_nic_name                   = "bikenic1"
    disable_password_authentication = false
  }
}
  
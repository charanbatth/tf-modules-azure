resource "azurerm_network_interface" "nic" {
  name                = "windows-us-vm-nic"
  location            = "West US"
  resource_group_name = "terraform-resources-rg"

  ip_configuration {
    name                          = "vmconfiguration"
    subnet_id                     = "/subscriptions/be3ad44a-5ce6-44ab-806f-09de8f80f7c7/resourceGroups/terraform-resources-rg/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/internal-resources"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "terraform_azure_vm" {
  name                  = "terraform-us-vm"
  location              = "West US"
  resource_group_name   = "terraform-resources-rg"
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
   delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
   delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  storage_os_disk {
    name              = "terraform-vm-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "terraform-vm-data-disk"
    create_option     = "Empty"
    managed_disk_type = "Standard_LRS"
    disk_size_gb = "10"
    lun = 1
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_windows_config {
    #disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

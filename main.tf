module "new-resource-group" {
  source                  = "./modules/resourcegroup"
  resource_group_name     = "first-rg-test"
  resource_group_location = "West US"
}

module "new-vnet" {
  source = "./modules/vnet"
  virtual_network_name = "public-virtual-network"
  resource_group_name = module.new-resource-group.resource_group_name
  address_space = ["10.0.0.0/16"]
  virtual_network_location = module.new-resource-group.resource_group_location
  subnet_name = "internal-resources"
  address_prefixes = ["10.0.1.0/24","10.0.2.0/24"]
  depends_on = [ module.new-resource-group ]
}

module "new-virtuel_machine" {
  source = "./modules/vm"
  
}
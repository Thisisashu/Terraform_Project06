module "resource-group" {
    source = "./modules/general/resourcegroup"
    resource_group_name = var.resource_group_name
    location = var.location
}   

module "network" {
    source = "./modules/networking/vnet"
    resource_group_name = var.resource_group_name
    location = var.location
    vnet_name = var.vnet_name
    vnet_address_prefix = var.vnet_address_prefix
    vnet_subnet_count = var.vnet_subnet_count
    public_ip_address_count = var.public_ip_address_count
    netwrok_interface_count = var.netwrok_interface_count
    network_security_group_rules = var.network_security_group_rules
    depends_on = [ module.resource-group ]
}   

# module "machines" {
#   source = "./modules/compute/virtualmachines"
#   resource_group_name = var.resource_group_name
#   location = var.location
#   virtual_machine_count = var.virtual_machine_count
#  virtual_network_interface_ids = module.network.virtual_network_interfaces_ids
#   virtual_machine_public_ip_addresses = module.network.public_ip_addresses

# }

module "load-balancer"{
  source = "./modules/networking/loadbalancer"
  resource_group_name = var.resource_group_name
  location = var.location
  number_of_machines = var.virtual_machine_count
  virtual_network_id = module.network.virtual_network_id
  network_interface_private_ip_address = module.network.network_interface_private_ip_address
}
module "virtualmachine-scale-set" {
  source = "./modules/compute/scalesets"
  resource_group_name = var.resource_group_name
  location = var.location
  virtual_network_subnet_ids = module.network.virtual_network_subnet_id
  virtual_machine_pool_id = module.load_balancer_backend_address_pool_id
}
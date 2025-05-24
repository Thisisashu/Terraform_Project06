variable "resource_group_name" {
  type = string
  description = "This defines the resource group name"
}
variable "location" {
  type = string
  description = "This defines the loaction of the resources"
}
variable "virtual_network_subnet_ids" {
  type = list(string)
  description = "This defines the subnet ids of the subnets in the virtual network"
}
variable "virtual_machine_pool_id" {
  type = string
  description = "This is the id of the backend pool attached to the load balancer"
}
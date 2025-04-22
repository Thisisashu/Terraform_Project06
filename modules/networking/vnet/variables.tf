variable "location" {
  type = string
  description = "This defines the location of resources"
}

variable "resource_group_name" {
  type = string
  description = "This defines the name of the resource group"
}
variable "vnet_name" {
  type = string
  description = "this defines the name of the virtual network"
}

variable "vnet_address_prefix" {
  type = string
  description = "This defines the address prefix of the virtual machine"
}

variable "vnet_subnet_count" {
  type = string
  description = "This defines the number of subnets in the virtual network"
}

variable "netwrok_interface_count" {
  type = number
  description = "This defines the number of netwrok interfaces"
}
variable "public_ip_address_count" {
  type = string
  description = "This defines the number of public ip addresses"
}
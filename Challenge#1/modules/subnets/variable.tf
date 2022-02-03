variable "name" {
  description = "The name of the module demo resource group in which the resources will be created"
  type        = string
  default     = "subnet"
}
variable "resource_group_name" {
  description = "The name of the module demo resource group in which the resources will be created"
  type        = string
  default     = "project-rg"
}

variable "virtual_network_name" {
  type    = string
  default = "my_vnet"
}

variable "address_prefixes" {
  description = "The location where module demo resource group will be created"
  type        = list
  default     = ["10.10.0.0/16"]
}

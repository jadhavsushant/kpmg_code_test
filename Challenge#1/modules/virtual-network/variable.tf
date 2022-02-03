variable "name" {
  description = "The name of the module demo resource group in which the resources will be created"
  type        = string
  default     = "virtual-network"
}
variable "resource_group_name" {
  description = "The name of the module demo resource group in which the resources will be created"
  type        = string
  default     = "project-rg"
}

variable "location" {
  description = "The name of the module demo resource group in which the resources will be created"
  type        = string
  default     = "westus"
}
variable "address_space" {
  description = "The location where module demo resource group will be created"
  type        = list(any)
  default     = ["10.0.0.0/16"]
}


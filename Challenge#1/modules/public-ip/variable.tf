variable "name" {
  description = "external-pip"
  type        = string
  default     = "exteranl-pip"
}
variable "resource_group_name" {
  description = "The name of the module demo resource group in which the resources will be created"
  type        = string
  default     = "project-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}


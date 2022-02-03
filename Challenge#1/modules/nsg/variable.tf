variable "nsg_name" {
  description = "nsg name"
  type        = string
  default     = "nsg"

}

variable "location" {
  description = "Resource location"
  type        = string
  default     = "eastus"

}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
  default     = "project-rg"
}

variable "inbound_ports_map" {
  description = "resource group name"
  type        = string
  default     = "project-rg"
}


/* variable "locals" {
  description = "Defining the local"
  type = 

} */
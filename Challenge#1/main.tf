
# Creating the resource group
module "resource_group" {
  source   = "./modules/resource-group"
  location = "westus"
  name     = "rg-wu-projectx"

}

# creating the virtual network for
module "virtual_network" {
  source              = "./modules/virtual-network"
  name                = "multi-tier-vnet"
  resource_group_name = module.resource_group.RG_name
  address_space       = ["10.10.0.0/16"]
  depends_on          = [module.resource_group]

}

#defining the multiple virtual networks
variable "subnets" {
  description = "create a list of subnet require to be created"
  type        = map(any)
  default = {
    app_subnet = {
      name                 = "web_subnet",
      resource_group_name  = "rg-wu-projectx",
      virtual_network_name = "my_vnet",
      address_prefixes     = ["10.10.1.0/24"]
    },
    app_subnet = {
      name                 = "app_subnet",
      resource_group_name  = "rg-wu-projectx",
      virtual_network_name = "my_vnet",
      address_prefixes     = ["10.10.2.0/24"]
    },
    db_subnet = {
      name                 = "db_subnet",
      resource_group_name  = "rg-wu-projectx",
      virtual_network_name = "my_vnet",
      address_prefixes     = ["10.10.2.0/24"]
    }
  }
}

# creating the subnets
module "subnet" {
  source               = "./modules/subnets"
  for_each             = var.subnets
  name                 = each.value.name
  virtual_network_name = module.virtual_network.vnet_name
  resource_group_name  = module.virtual_network.rg_name
  address_prefixes     = each.value.address_prefixes
  depends_on = [
    module.virtual_network
  ]
}

# defining the local block for port mapping to security group
locals {
  web_inbound_port_map = {
    "110" : "80",
    "120" : "433"
  }
}

locals {
  app_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "8080",
  }
}

locals {
  db_inbound_ports_map = {
    "100" : "1433",
    "110" : "1434",
  }
}

# creating the network security group for all subnets
module "web_network_security_group" {
  source = "./modules/nsg"
  /* foreach             = locals.web_inbound_port_map */
  nsg_name            = "web_nsg"
  resource_group_name = module.resource_group.RG_name
}

# creating the public IP address to access the front-end app
module "public_ip" {
  source              = "./modules/public-ip"
  location            = module.resource_group.rg_location
  name                = "extera-pip"
  resource_group_name = module.resource_group.RG_name

}

# creating the Azure load Balancer for db-subnet

# creating the Azure load Balancer for app-subnet


# creating the Azure load Balancer for web-subnet


# creating the webapp  to host the front end web site.


# creating the app-servers for business logic.

# creating the DB for backend storage.








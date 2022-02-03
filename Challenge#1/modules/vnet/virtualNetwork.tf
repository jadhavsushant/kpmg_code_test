
# Create Virtual Network resource
# Creating Vnet
resource "azurerm_virtual_network" "myvnet" {
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  name                = "${var.pre}-${var.vnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
}

# defining the web-tier subnet
resource "azurerm_subnet" "web-subnet" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.web_subnet_address
}

# defining the app-tier subnet
resource "azurerm_subnet" "app-subnet" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.app_subnet_address
}

# defining the db-tier subnet
resource "azurerm_subnet" "db-subnet" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.db_subnet_address
}


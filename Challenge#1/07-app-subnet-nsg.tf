
# In this configuration file creating the NSG for all subnet
####
###
  #
# App Subnet NSG - Creating the NSG for app subnet
resource "azurerm_network_security_group" "app-nsg" {
  location            = azurerm_resource_group.rg.location
  name                =  "${azurerm_subnet.app-subnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
}

# associate nsg with app subnet
resource "azurerm_subnet_network_security_group_association" "app_nsg_associate" {
  network_security_group_id = azurerm_network_security_group.app-nsg.id
  subnet_id                 = azurerm_subnet.app-subnet.id
  depends_on = [azurerm_network_security_rule.app_nsg_subnet_inbound]
}

# app subnet rule opening the port 80 and 443 for external world
# Creating the network security rule looping locals blocks
resource "azurerm_network_security_rule" "app_nsg_subnet_inbound" {
  for_each = local.app_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.app-nsg.name
}
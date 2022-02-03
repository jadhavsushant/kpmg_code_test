
# In this configuration file creating the NSG for all subnet
####
###
  #
# Web Subnet NSG - Creating the NSG for web subnet
resource "azurerm_network_security_group" "web-nsg" {
  location            = azurerm_resource_group.rg.location
  name                =  "${azurerm_subnet.web-subnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
}

# associate nsg with web subnet
resource "azurerm_subnet_network_security_group_association" "web_nsg_associate" {
  network_security_group_id = azurerm_network_security_group.web-nsg.id
  subnet_id                 = azurerm_subnet.web-subnet.id
  depends_on = [azurerm_network_security_rule.web_nsg_subnet_inbound]
}

# web subnet rule opening the port 80 and 443 for external world
# Creating the network security rule looping locals blocks
resource "azurerm_network_security_rule" "web_nsg_subnet_inbound" {
  for_each = local.web_inbound_port_map
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
  network_security_group_name = azurerm_network_security_group.web-nsg.name
}
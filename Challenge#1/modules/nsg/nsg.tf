
resource "azurerm_network_security_group" "nsg_subnets" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
/* 
resource "azurerm_network_security_rule" "nsg_subnet_inbound" {
  for_each                    = var.inbound_ports_map
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

resource "azurerm_subnet_network_security_group_association" "nsg_associate" {
  network_security_group_id = azurerm_network_security_group.app-nsg.id
  subnet_id                 = azurerm_subnet.app-subnet.id
  depends_on                = [azurerm_network_security_rule.app_nsg_subnet_inbound]
} */

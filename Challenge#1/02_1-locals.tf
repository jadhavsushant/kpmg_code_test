# Local block  port mapping to create the incoming rule in web_subnet_nsg
locals {
  web_inbound_port_map ={
    "110" : "80",
    "120" : "433"
  }
}

# Local block  port mapping to create the incoming rule in app_subnet_nsg
locals {
  app_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "8080",
  }
}

# Local block  port mapping to create the incoming rule in db_subnet_nsg
locals {
  db_inbound_ports_map = {
    "100" : "1433",
    "110" : "1434",
  }
}
/*
Unten die Ressource umstellen auf Mongo DB !!!
Zu klären ist, wie korrekte SKU zuweisen und 
finale Bereitstellung

*/

module "general_module"{
  source="./modules/general"
  resource_group_name=local.resource_group_name
  location=local.location
}

module "networking_module" {
  source="./modules/networking"
  resource_group_name=local.resource_group_name
  location=local.location
  virtual_network_name="IT-P_Demo-network"
  virtual_network_address_space="10.0.0.0/16"
  subnet_names=["web-subnet","db-subnet"]
  bastion_required=true
  network-security_group_names={
    "web-nsg"="web-subnet"
    "db-nsg"="db-subnet"}
  
    network_security_group_rules=[{
      id=1,
      priority="200",
      network_security_group_name="web-nsg"
      destination_port_range="3389"
      access="Allow"
  },
  {
      id=2,
      priority="300",
      network_security_group_name="web-nsg"
      destination_port_range="80"
      access="Allow"
  },
  {
      id=3,
      priority="400",
      network_security_group_name="web-nsg"
      destination_port_range="8172"
      access="Allow"
  },
  {
      id=4,
      priority="200",
      network_security_group_name="db-nsg"
      destination_port_range="3389"
      access="Allow"
  }
  ]
}

module "compute_module"{
  source="./modules/compute"
  resource_group_name=local.resource_group_name
  location=local.location
  network_interface_name="db-interface"
  subnet_id=module.networking_module.subnets["db-subnet"].id
  virtual_machine_name="dbvm"
  admin_username="dbusr"
  admin_password="Azure@123"
  source_image_reference ={
    publisher = "MicrosoftSQLServer"
    offer     = "sql2019-ws2019"
    sku       = "sqldev"
    version   = "15.0.220510"
  }
  depends_on = [
    module.networking_module
  ]
}

resource "azurerm_mssql_virtual_machine" "mssqlmachine" {
  virtual_machine_id = module.compute_module.vm.id
  sql_license_type   = "PAYG"
  sql_connectivity_update_password = "Azure@1234"
  sql_connectivity_update_username = "sqladmin"
  sql_connectivity_port            = 1433
  sql_connectivity_type            = "PRIVATE"
}
  
data "azurerm_cosmosdb_account" "ITP-Demo_acct" {
  name                = "ITP-cosmosdb-account"
  resource_group_name = "local.resource_group_name"
}

resource "azurerm_cosmosdb_mongo_database" "ITP-Demo" {
  name                = "ITP-cosmos-mongo-db"
  resource_group_name = local.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.ITP-Demo_acct.name
  throughput          = 400
}

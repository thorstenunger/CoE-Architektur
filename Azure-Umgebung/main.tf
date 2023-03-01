/*

Hier sind IDs und das Secret anzupassen auf die jeweils 
genutzte Umgebung.
Terraform-App in AAD als App-Registration anlegen nicht 
vergessen.

- subscription_ID ist klar
- tenant_id und client_id  sind bei den Details des reg-app 
  Terraform Objekts
- client_secret muss erstellt werden: Eigenschaften des 
  Terraform Objekts, dann bei "Certificates and Secrtets"  ein 
  Neues erstellen

ACHTUNG:
Alle Werte können auch als Umgebungsvariable abgelegt werden, damit z.B. im GIT in den Downloads keine Creds auftauchen:
  subscription-id   wird zur Umgebungsvariablen arm_subscription_id
  tenant_id  zu  arm_tenant_id
  client_id  zu  arm_client_id
  client_secret  wird zu  arm_client_secret
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}


provider "azurerm" {
  subscription_id = "c3498af5-7439-4159-8791-7041d85318eb"
  tenant_id       = "f16b93ce-4a22-4083-b67e-7bb9d3fed127"
  client_id       = "f6d97b22-1f34-4b88-896d-3733f8436062"
  client_secret   = "ExAmPlE"
  // client_secret wird üblicherweise bei Aufruf über cli zugeführt
  features {}
}

module "general_module" {
  source              = "./modules/general"
  resource_group_name = local.resource_group_name
  location            = local.location
}

module "networking_module" {
  source                        = "./modules/networking"
  resource_group_name           = local.resource_group_name
  location                      = local.location
  virtual_network_name          = "IT-P_Demo-network"
  virtual_network_address_space = "10.0.0.0/16"
  subnet_names                  = ["web-subnet", "db-subnet"]
  bastion_required              = true
  network-security_group_names = {
    "web-nsg" = "web-subnet"
  "db-nsg" = "db-subnet" }

  network_security_group_rules = [{
    id                          = 1,
    priority                    = "200",
    network_security_group_name = "web-nsg"
    destination_port_range      = "3389"
    access                      = "Allow"
    },
    {
      id                          = 2,
      priority                    = "300",
      network_security_group_name = "web-nsg"
      destination_port_range      = "80"
      access                      = "Allow"
    },
    {
      id                          = 3,
      priority                    = "400",
      network_security_group_name = "web-nsg"
      destination_port_range      = "8172"
      access                      = "Allow"
    },
    {
      id                          = 4,
      priority                    = "200",
      network_security_group_name = "db-nsg"
      destination_port_range      = "3389"
      access                      = "Allow"
    }
  ]
}

module "app_storage_module" {
  source                 = "./modules/storage"
  resource_group_name    = local.resource_group_name
  location               = local.location
  storage_account_name   = "appstore4656656"
  container_name         = "APP-Data"
  container_access       = "blob"
  storage_account_exists = true
  blobs_binary_enabled   = true
  blobs_binary = {
    "XXXXX.PS1" = "./APP-Data/"
  }
  depends_on = [
    module.general_module,
  ]
}

/*
Die DB-Ressource ist umgestellt auf Mongo DB !!!
Zu klären ist, wie korrekte SKU zuweisen
*/

data "azurerm_cosmosdb_account" "ITP-Demo_acct" {
  name                = "ITP-cosmosdb-account"
  resource_group_name = "local.resource_group_name"
}

resource "azurerm_cosmosdb_mongo_database" "ITP-Demo" {
  name                = "ITP-cosmos-mongo-db"
  resource_group_name = local.resource_group_name
  account_name        = data.azurerm_cosmosdb_account.ITP-Demo_acct.name
  throughput          = 600
}


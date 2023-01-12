/*

Hier sind IDs und das Secret anzupassen auf die jeweils 
genutzte Umgebung.
Terraform-App in AAD als App-Registration anlegen nicht 
vergessen.

- subscription ID ist klar
- tenant_id und client_id  sind bei den Details des reg-app 
  Terraform Objekts
- client_sectret muss erstellt werden: Eigenschaften des 
  Terraform Objekts, dann bei "Certificates and Secrtets"  ein 
  Neues erstellen

*/

terraform {    
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}


provider "azurerm" {
 subscription_id = "6912d7a0-bc28-459a-9407-33bbba641c07"
  tenant_id = "70c0f6d9-7f3b-4425-a6b6-09b47643ec58"
  client_id = "d247a470-217b-44ae-b35c-8605a63dfe5c"
  client_secret = "Q468Q~Ymf9BDECmUbyF..i64i4kEUxDqJGPxsaBp"
  features {}  
}

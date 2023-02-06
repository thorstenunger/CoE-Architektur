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
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}


provider "azurerm" {
 subscription_id = "6912d7a0-bc28-459a-9407-33bbba641c07example"
  tenant_id = "70c0f6d9-7f3b-4425-a6b6-09b47643ec58example"
  client_id = "d247a470-217b-44ae-b35c-8605a63dfe5cexample"
  client_secret = "Q468Q~Ymf9BDECmUbyF..i64i4kEUxDqJGPxsaBpexample"
  features {}  
}

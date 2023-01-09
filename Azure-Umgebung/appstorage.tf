/*

Hier dringend noch den Namen des Storage Account anpassen!
Und dann natürlich die Namen und Orte der für die APP  
bereitzustellenden Daten der Applikation hinzufügen unter 
blobs_binary

*/


module "app_storage_module"{
    source="./modules/storage"
    resource_group_name=local.resource_group_name
    location=local.location    
    storage_account_name="appstore4656656"
    container_name="APP-Data"    
    container_access="blob"
    storage_account_exists=true
    blobs_binary_enabled=true
    blobs_binary={
        "XXXXX.PS1"="./APP-Data/"
    }
    depends_on = [
      module.general_module,
      module.storage_module
    ]
}
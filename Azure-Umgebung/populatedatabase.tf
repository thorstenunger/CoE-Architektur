/*

Storage Account anpasssen  
!!!!! Achtung, muss ich noch als Variable hinterlegen !!!!!

1 Daten hinterlegen, die in die DB sollen.
2 Custom Script hinterlegen, um die DB zu befüllen / einzurichten.

!!!!! Auch hier: Ist noch nicht vollständig modularisiert !!!!!

*/


/*
nicht mehr nötig nach Umstellung auf Mongo-DB


module "storage_module"{
    source="./modules/storage"
    resource_group_name=local.resource_group_name
    location=local.location
    storage_account_name="appstore4656656"
    container_name="dbscripts"
    app_container_name = "APP-data"
    blobs_enabled = true
    container_access="blob"
    blobs={
        "01.sql"="./dbscripts/"
        "Script.ps1"="./scripts/"
    }
    depends_on = [
      module.general_module
    ]
}

module custom_script {
  source="./modules/compute/customscript"
  extension_name="dbvm-extension"
  virtual_machine_id=module.compute_module.vm.id
  extension_type={
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  }
  storage_account_name="appstore4656656"
  container_name="scripts"

  depends_on = [
    module.compute_module,
    module.storage_module,
    azurerm_mssql_virtual_machine.mssqlmachine
  ]
}

*/
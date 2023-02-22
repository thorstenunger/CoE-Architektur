locals {
  resource_group_name = "IT-P_Demo-grp"
  location            = "North Europe"
  virtual_network = {
    address_space = "10.0.0.0/16"
  }
}
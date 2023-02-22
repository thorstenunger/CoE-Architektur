variable "storage_account_name" {
  type=string
  description="This defines the storage account name"
}

variable "resource_group_name" {
  type=string
  description="This defines the name of the resource group"
}

variable "location" {
  type=string
  description="This defines the location of the virtual network"
}

variable "container_name" {
  type=string
  description="This defines the container name"
}

variable "app_container_name" {
  type=string
  description="This defines the container name for the application"
  default="default"
}

variable "container_access" {
  type=string
  description="This defines the container access level"
  default = "private"
}

variable "blobs" {
  type=map
  description="This defines the blobs to be added"
  default = {""=""}
}

variable "storage_account_exists" {
  type=bool
  description="This defines the whether the storage account exists"
  default = false
}

variable "blobs_binary" {
  type=map
  description="This defines the binary blobs to be added"
  default = {""=""}
}

variable "blobs_enabled" {
  type=bool
  description="This defines the blobs need to be uploaded"
  default = false
}

variable "blobs_binary_enabled"{
  type=bool
  description="This defines the binary blobs need to be uploaded"
  default = false
}
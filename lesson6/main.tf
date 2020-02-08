variable "client_secret" {}


# Configure the Azure provider
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.43.0"

  subscription_id = "8e5414cf-26ac-43c3-bac4-3e9235fbcbda"
  client_id       = "6b3ce04c-aa0f-4891-bf68-da8848f8695a"
  client_secret   = var.client_secret 
  tenant_id       = "a0069489-a230-4760-ace3-69d00d1a8923"
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
    name     = "myTFResourceGroup"
    location = "eastus"

    tags = {
        name = "lesson6"
    }
}
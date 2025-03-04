terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
      
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "be3ad44a-5ce6-44ab-806f-09de8f80f7c7"
  features {
    
  }
}
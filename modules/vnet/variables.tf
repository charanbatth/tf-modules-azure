variable "virtual_network_name" {
  type = string
  nullable = false

}

variable "virtual_network_location" {
    type = string
    default = "West US"
  
}

variable "resource_group_name" {
    type = string
      
}

variable "address_space" {
    type = set(string)
  
}

variable "subnet_name" {
    type = string
  
}

variable "address_prefixes" {
    type = set(string)
  
}
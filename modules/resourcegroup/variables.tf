variable "resource_group_name" {
  type = string
  nullable = false
  description = "use company naming policy"
}
variable "resource_group_location" {
    type = string
    default = "West US"
}
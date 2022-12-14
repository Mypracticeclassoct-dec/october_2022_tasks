variable "region" {
  type=string
  description = "This is the region of the provider"
}
variable "cidr" {
    type = string
    default = "10.10.0.0/16"
    description = "This is the cidr of the vpc"  
}
variable "subnet_az" {
    type = list(string)
    description = "This is the subnet availability zones"
  }
  variable "subnet_cidr" {
    type = list(string)
    description = "This is the subnet cidr ranges"
  }
  variable "subnet_nm" {
    type=list(string)
    description = "This is the subnet names "
  }
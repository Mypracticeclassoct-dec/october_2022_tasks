variable "region" {
   type = string
   default = "us-east-1"
   description = "This is the region in which our resource is created"
}
variable "cidr" {
  type = list(string)
  description = "The vpc's cidr blocks"
}
variable "subnet_az" {
    type = list(string)
    description = "This is the availability zones for  the subnets" 
}
variable "subnet_nm" {
    type = list(string)
    description = "This is the subnet names list variable"  
}
variable "vpc_nm" {
    type = list(string)
    description = "The names of vpc created"  
}
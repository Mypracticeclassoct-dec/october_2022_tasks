module "modulefiles" {
  source = "./modulefiles"

  region      = var.region
  cidr        = var.cidr
  subnet_cidr = var.subnet_cidr
  subnet_az   = var.subnet_az
  subnet_nm   = var.subnet_nm
}

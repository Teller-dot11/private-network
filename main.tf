module "network" {
 source = "./modules/network"
 region = var.region
}

module "nat" {
 source = "./modules/nat"
 network_id = module.network.vpc_id
 region = var.region
}

module "compute" {
 source = "./modules/compute"
 subnet_id = module.network.subnet_id
 zone = var.zone
}

module "loadbalancer" {
 source = "./modules/loadbalancer"
 instance_id = module.compute.instance_id
 zone = var.zone
}

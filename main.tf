module "network" {
 source = "./modules/network"
 vpc_name = var.vpc_name
 subnet_name =  var.subnet_name
 region = var.region
}

module "nat" {
 source = "./modules/nat"
 router_name = var.router_name
 nat_name = var.nat_name
 network_id = module.network.vpc_id
 region = var.region
}

module "compute" {
 source = "./modules/compute"
 vm_name = var.vm_name
 machine_type = var.machine_type
 subnet_id = module.network.subnet_id
 zone = var.zone
}

/*
module "loadbalancer" {
 source = "./modules/loadbalancer"
 group_name = var.group_name
 hc_name = var.hc_name
 backend_name = var.backend_name
 url_name = var.url_name
 proxy_name = var.proxy_name
 rule_name = var.rule_name
 instance_id = module.compute.instance_id
 zone = var.zone
}
*/

module "firewall" {
  source = "./modules/firewall"
 // network_name = module.network.vpc_name
  network_id = module.network.vpc_id
}
/*
module "certificate" {
  source = "./modules/certificate"
  domain = var.domain
}
*/
module "loadbalancer" {
  source = "./modules/loadbalancer"

  group_name    = var.group_name
  hc_name       = var.hc_name
  backend_name  = var.backend_name
  url_name      = var.url_name
  proxy_name    = var.proxy_name
  rule_name     = var.rule_name
  instance_id   = module.compute.instance_id
  zone          = var.zone

 // certificate_id = module.certificate.certificate_id
}

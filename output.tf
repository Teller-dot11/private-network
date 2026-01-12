output "load_balancer_ip" {
 value = module.loadbalancer.lb_ip
}

output "vm_internal_ip" {
 value = module.compute.internal_ip
}

output "https_load_balancer_ip" {
  value = module.loadbalancer.https_lb_ip
}

output "lb_ip" {
 value = google_compute_global_forwarding_rule.rule.ip_address
}

output "https_lb_ip" {
  description = "IP address of the HTTPS load balancer"
  value       = google_compute_global_forwarding_rule.https_rule.ip_address
}

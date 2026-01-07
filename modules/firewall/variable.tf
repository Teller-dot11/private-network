variable "network_name" {
  description = "Name of the VPC network where firewall rules will be applied."
  type = string
}

variable "internal_cidr" {
  description = "CIDR range allowed for internal VPC communication."
  type = string
  default = "10.0.0.0/16"
}

variable "lb_health_check_ranges" {
  description = "Source IP ranges used by Google HTTP(S) Load Balancer health checks."
  type = list(string)
  default = [
    "130.211.0.0/22",
    "35.191.0.0/16"
  ]
}

variable "iap_ssh_ranges" {
  description = "Source IP ranges used by Google IAP for SSH access."
  type = list(string)
  default = ["35.235.240.0/20"]
}

variable "target_tags" {
  description = "Network tags applied to VM instances for firewall targeting."
  type = list(string)
  default = ["web"]
}

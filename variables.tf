variable "project_id" {
 type = string
 default = "strategic-cargo-483609-k0"
}
variable "region" {
 type = string
 default = "asia-south1"
}
variable "zone" {
 type = string
 default = "asia-south1-a"
}
variable "vm_name" {
 type = string
 default = "private-web-vm"
}
variable "machine_type" {
 type = string
 default = "e2-micro"
}
variable "group_name" {
 type = string
 default = "web-group"
}
variable "hc_name" {
 type = string
 default = "http-hc"
}
variable "backend_name" {
 type = string
 default = "web-backend"
}
variable "url_name" {
 type = string
 default = "url-map"
}
variable "proxy_name" {
 type = string
 default = "http-proxy"
}
variable "rule_name" {
 type = string
 default = "http-rule"
}
variable "router_name" {
 type = string
 default = "nat-router"
}
variable "nat_name" {
 type = string
 default = "cloud-nat"
}
variable "vpc_name" {
 type = string
 default = "private-vpc"
}
variable "subnet_name" {
 type = string
 default = "private-subnet"
}

variable "domain" {
  type        = string
  description = "Domain name for HTTPS certificate"
  domain = "example.yourdomain.com"
}

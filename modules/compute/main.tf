resource "google_compute_instance" "vm" {
 name = var.vm_name //"private-web-vm"
 machine_type = var.machine_type //"e2-micro"
 zone = var.zone

 tags = ["web"]

 boot_disk {
 initialize_params {
  image = "debian-cloud/debian-12"
  }
 }

 network_interface {
  subnetwork = var.subnet_id
 }

 metadata_startup_script = <<-EOF
 #!/bin/bash
 apt-get update
 apt-get install -y apache2
 echo "Hello from Private VM" > /var/www/html/index.html
 EOF
}

// Define our provider for vsphere
provider "vsphere" {
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  vsphere_server       = "${var.vsphere_server}"
  allow_unverified_ssl = "${var.vsphere_allow_unverified_ssl}"
}

// Define our datacenter
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

// Define our datastore
data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

// Define our resource pool
data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

// Define our primary network
data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

// Define our vm template
data "vsphere_virtual_machine" "template" {
  name          = "Templates/centos7"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

// Define our sds server using the vs_ecm_vm module
module "salt-master" {
  source           = "modules/vs_ecm_vm"
  name             = "salt-master"
  domain           = "clearobject.lab"
  num_cpus         = 2
  memory           = 4096

  // Disk 0
  disk_0_size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
  disk_0_eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
  disk_0_thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"

  // Disk 1
  disk_1_size             = 32
  disk_1_thin_provisioned = "true"
  disk_1_unit_number      = 1

  // Networking
  ipv4_address     = "10.20.20.90"
  ipv4_netmask     = "24"
  ipv4_gateway     = "10.20.20.254"

  // Variable you probably dont need to touch...
  // should look to see if we can move this out to a separate vars file
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datasource_id    = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  network_id       = "${data.vsphere_network.network.id}"
  adapter_type     = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  template_uuid    = "${data.vsphere_virtual_machine.template.id}"
}

// Define our sds server using the vs_ecm_vm module
module "consul1" {
  source           = "modules/vs_ecm_vm"
  name             = "consul1"
  domain           = "clearobject.lab"
  num_cpus         = 1
  memory           = 4096

  // Disk 0
  disk_0_size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
  disk_0_eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
  disk_0_thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"

  // Disk 1
  disk_1_size             = 32
  disk_1_thin_provisioned = "true"
  disk_1_unit_number      = 1

  // Networking
  ipv4_address     = "10.20.20.80"
  ipv4_netmask     = "24"
  ipv4_gateway     = "10.20.20.254"

  // Variable you probably dont need to touch...
  // should look to see if we can move this out to a separate vars file
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datasource_id    = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  network_id       = "${data.vsphere_network.network.id}"
  adapter_type     = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  template_uuid    = "${data.vsphere_virtual_machine.template.id}"
}


// Define our sds server using the vs_ecm_vm module
module "consul2" {
  source           = "modules/vs_ecm_vm"
  name             = "consul2"
  domain           = "clearobject.lab"
  num_cpus         = 1
  memory           = 4096

  // Disk 0
  disk_0_size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
  disk_0_eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
  disk_0_thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"

  // Disk 1
  disk_1_size             = 32
  disk_1_thin_provisioned = "true"
  disk_1_unit_number      = 1

  // Networking
  ipv4_address     = "10.20.20.81"
  ipv4_netmask     = "24"
  ipv4_gateway     = "10.20.20.254"

  // Variable you probably dont need to touch...
  // should look to see if we can move this out to a separate vars file
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datasource_id    = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  network_id       = "${data.vsphere_network.network.id}"
  adapter_type     = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  template_uuid    = "${data.vsphere_virtual_machine.template.id}"
}

// Define our sds server using the vs_ecm_vm module
module "consul3" {
  source           = "modules/vs_ecm_vm"
  name             = "consul3"
  domain           = "clearobject.lab"
  num_cpus         = 1
  memory           = 4096

  // Disk 0
  disk_0_size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
  disk_0_eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
  disk_0_thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"

  // Disk 1
  disk_1_size             = 32
  disk_1_thin_provisioned = "true"
  disk_1_unit_number      = 1

  // Networking
  ipv4_address     = "10.20.20.82"
  ipv4_netmask     = "24"
  ipv4_gateway     = "10.20.20.254"

  // Variable you probably dont need to touch...
  // should look to see if we can move this out to a separate vars file
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datasource_id    = "${data.vsphere_datastore.datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"
  network_id       = "${data.vsphere_network.network.id}"
  adapter_type     = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  template_uuid    = "${data.vsphere_virtual_machine.template.id}"
}

variable "name" {}
variable "domain" {}
variable "resource_pool_id" {}
variable "datasource_id" {}
variable "num_cpus" {}
variable "memory" {}
variable "guest_id" {}
variable "scsi_type" {}
variable "network_id" {}
variable "adapter_type" {}

variable "template_uuid" {}

// Network vars
variable "ipv4_address" {}
variable "ipv4_netmask" {}
variable "ipv4_gateway" {}

// Disk 0 vars
variable "disk_0_size" {}
variable "disk_0_eagerly_scrub" {}
variable "disk_0_thin_provisioned" {}

// Disk 1 vars
variable "disk_1_size" {}
variable "disk_1_thin_provisioned" {}
variable "disk_1_unit_number" {}

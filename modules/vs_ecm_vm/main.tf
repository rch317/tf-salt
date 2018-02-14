// vs_ecm_vm
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.name}"
  resource_pool_id = "${var.resource_pool_id}"
  datastore_id     = "${var.datasource_id}"

  num_cpus = "${var.num_cpus}"
  memory   = "${var.memory}"
  guest_id = "${var.guest_id}"

  scsi_type = "${var.scsi_type}"

  network_interface {
    network_id   = "${var.network_id}"
    adapter_type = "${var.adapter_type}"
  }

  disk {
    label            = "${var.name}.vmdk"
    size             = "${var.disk_0_size}"
    eagerly_scrub    = "${var.disk_0_eagerly_scrub}"
    thin_provisioned = "${var.disk_0_thin_provisioned}"
  }

  disk {
    label            = "${var.name}_opt.vmdk"
    size             = "${var.disk_1_size}"
    thin_provisioned = "${var.disk_1_thin_provisioned}"
    unit_number      = "${var.disk_1_unit_number}"
  }

  clone {
    template_uuid = "${var.template_uuid}"

    customize {
      linux_options {
        host_name = "${var.name}"
        domain    = "${var.domain}"
      }

      network_interface {
        ipv4_address = "${var.ipv4_address}"
        ipv4_netmask = "${var.ipv4_netmask}"
      }

      ipv4_gateway = "${var.ipv4_gateway}"
    }
  }
}

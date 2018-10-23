variable "do_token" {}
variable "number_servers" {}
variable "do_size" {}
variable "do_sshkey" {}

provider "digitalocean" {
  token               = "${var.do_token}"
}

resource "digitalocean_droplet" "node" {
  count               = "${var.number_servers}"
  ssh_keys            = ["${var.do_sshkey}"]
  image               = "${var.ubuntu}"
  size                = "${var.do_size}"
  region              = "${var.do_ams3}"
  name                = "${count.index}.devops.horn.uk"

  private_networking  = true
  ipv6                = true

  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' ansible/master.yml"
  }
}


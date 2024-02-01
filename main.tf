resource "ibm_is_instance" "Instance" {
	name = local.InstanceName
	image = data.ibm_is_image.Image.id
	profile = local.InstanceProfile
	user_data = local.agent_init_cli
	primary_network_interface {
		name = "eth0"
		primary_ip {
			address = local.Eth0PrivateIpAddress
		}
		subnet = data.ibm_is_subnet.Eth0Subnet.id
		security_groups = [data.ibm_is_security_group.Eth0SecurityGroup.id]
	}
	vpc = data.ibm_is_vpc.Vpc.id
	zone = local.Zone
	keys = [data.ibm_is_ssh_key.SshKey.id]
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
}

resource "ibm_is_floating_ip" "Eth0FloatingIp" {
	name = local.Eth0FloatingIpName
	target = ibm_is_instance.Instance.primary_network_interface[0].id
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
}
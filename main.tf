resource "ibm_is_instance" "Instance" {
	count = local.AllowMgmtIntfForTest ? 0 : 1
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
	network_interfaces {
		name = "eth1"
		primary_ip {
			address = local.Eth1PrivateIpAddresses[0]
		}
		subnet = data.ibm_is_subnet.Eth1Subnet[0].id
	}
	vpc = data.ibm_is_vpc.Vpc.id
	zone = local.Zone
	keys = []
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
}

resource "ibm_is_instance" "InstanceSingleIntf" {
	count = local.AllowMgmtIntfForTest ? 1 : 0
	name = local.InstanceName
	image = data.ibm_is_image.Image.id
	profile = local.InstanceProfile
	user_data = local.agent_init_cli_single_intf
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
	keys = []
	tags = [
		join(":", ["owner", replace(replace(local.UserEmailTag, ".", "-"), "@", "-")]),
		join(":", ["project", lower(local.UserProjectTag)])
	]
}
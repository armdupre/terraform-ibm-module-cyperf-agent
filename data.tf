data "ibm_is_security_group" "Eth0SecurityGroup" {
	name = local.Eth0SecurityGroupName
}

data "ibm_is_subnet" "Eth0Subnet" {
	name = local.Eth0SubnetName
}

data "ibm_is_image" "Image" {
	name = local.ImageName
}

data "ibm_is_ssh_key" "SshKey" {
	name = local.SshKeyName
}

data "ibm_is_vpc" "Vpc" {
	name = local.VpcName
}
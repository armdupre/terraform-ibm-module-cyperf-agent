locals {
	AllowMgmtIntfForTest = var.AllowMgmtIntfForTest
	AppEth0IpAddress = var.AppEth0IpAddress
	Eth0FloatingIpName = "${local.Preamble}-floating-ip"
	Eth0PrivateIpAddress = var.Eth0PrivateIpAddress	
	Eth0SecurityGroupName = var.Eth0SecurityGroupName
	Eth0SubnetName = var.Eth0SubnetName
	Eth1PrivateIpAddresses = var.Eth1PrivateIpAddresses
	Eth1SubnetName = var.Eth1SubnetName
	ImageName = var.ImageName
	InstanceId = var.InstanceId
	InstanceName = "${local.Preamble}-instance"
	InstanceProfile = var.InstanceProfile
	Preamble = "${local.UserLoginTag}-${local.Tag}-${local.Version}-${local.InstanceId}"
	SshKeyName = var.SshKeyName
	Tag = var.Tag
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
	Version = var.Version
	VpcName = var.VpcName
	Zone = var.Zone
}

locals {
	agent_init_cli_single_intf = <<-EOF
#!/bin/bash -xe
cyperfagent feature allow_mgmt_iface_for_test enable
cyperfagent controller set ${local.AppEth0IpAddress}
HOSTNAME=$(hostname)
cyperfagent tag set Cloud=IBM,Name=$(hostname)
    EOF
}

locals {
	agent_init_cli = <<-EOF
#!/bin/bash -xe
cyperfagent controller set ${local.AppEth0IpAddress}
HOSTNAME=$(hostname)
cyperfagent tag set Cloud=IBM,Name=$(hostname)
    EOF
}
variable "AllowMgmtIntfForTest" {
	default = false
	type = bool
}

variable "AppEth0IpAddress" {
	type = string
}

variable "Eth0PrivateIpAddress" {
	default = "10.0.10.11"
	type = string
}

variable "Eth0SecurityGroupName" {
	type = string
}

variable "Eth0SubnetName" {
	type = string
}

variable "Eth1PrivateIpAddresses" {
	default = [ "10.0.2.12" ]
	type = list(string)
}

variable "Eth1SubnetName" {
	default = null
	type = string
}

variable "ImageName" {
	default = "cyperf-agent-1-0-3-523"
	type = string
}

variable "InstanceId" {
	default = "agent1"
	type = string
}

variable "InstanceProfile" {
	default = "cx2-8x16"
	type = string
	validation {
		condition = can(regex("cx2-16x32", var.InstanceProfile)) || can(regex("cx2-8x16", var.InstanceProfile)) || can(regex("cx2-4x8", var.InstanceProfile))
		error_message = "InstanceProfile must be one of (cx2-16x32 | cx2-8x16 | cx2-4x8) sizes."
	}
}

variable "Tag" {
	default = "cyperf"
	type = string
}

variable "UserEmailTag" {
	type = string
	description = "Email address tag of user creating the stack"
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	type = string
	description = "Login ID tag of user creating the stack"
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = "example"
	type = string
}

variable "Version" {
	default = "2-10"
	type = string
}

variable "VpcName" {
	type = string
}

variable "Zone" {
	default = "us-south-1"
	type = string
}
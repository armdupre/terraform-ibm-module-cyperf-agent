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

variable "ImageName" {
	default = "cyperf-agent-2-6-image"
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
		condition = contains([	"cx2-4x8", "cx2-8x16", "cx2-16x32"
							], var.InstanceProfile)
		error_message = <<EOF
InstanceProfile must be one of the following sizes:
	cx2-4x8, cx2-8x16, cx2-16x32
		EOF
	}
}

variable "SshKeyName" {
	type = string
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
	default = "2-6"
	type = string
}

variable "VpcName" {
	type = string
}

variable "Zone" {
	default = "us-south-1"
	type = string
}
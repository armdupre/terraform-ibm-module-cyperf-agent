output "Eth0FloatingIp" {
	value = {
		"address" : ibm_is_floating_ip.Eth0FloatingIp[*].address
	}
}

output "Eth0FloatingIpSingleIntf" {
	value = {
		"address" : ibm_is_floating_ip.Eth0FloatingIpSingleIntf[*].address
	}
}

output "Image" {
	value = {
		"name" : data.ibm_is_image.Image.name
	}
}

output "Instance" {
	value = {
		"eth0_address" : ibm_is_instance.Instance[*].primary_network_interface[0].primary_ip[0].address
	}
}

output "InstanceSingleIntf" {
	value = {
		"eth0_address" :ibm_is_instance.InstanceSingleIntf[*].primary_network_interface[0].primary_ip[0].address
	}
}
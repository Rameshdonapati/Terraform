

variable "virtual_network_name" { 
    description = "value of vnet"
    type =  string
    default = "mydefault-vnet"
}

variable "virtual_subnet_name" { 
    description = "value of virtual subnet"
    type =  string
    default = "mydefault-subnet"
}

variable "vnet_cidr" { 
    description = "value of vnet space"
    type =  string
}

variable "subnet_cidr" { 
    description = "value of subnet space"
    type =  string
}

module "uatmodule" {
    source = "./modules"
    virtual_network_name = "sh-vnet-100"
    vnet_cidr = "10.10.0.0/16"
    subnet_cidr = "10.0.0.0/24"
} 


module "uatmodule" {
    source = "./modules"
    rglocation = "East US"
    rgname = "app100-RG"
    prefix = "sh"
    virtual_network_name = "sh-vnet-100"
    virtual_subnet_name = "sh-sn-000"
    vnet_cidr = "10.10.0.0/16"
    subnet_cidr = "10.0.0.0/24"
}
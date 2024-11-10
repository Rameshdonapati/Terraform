

module "uatmodule" {
    source = "./modules"
    rglocation = "East US"
    rgname = "app100-RG"
    prefix = "uat"
    virtual_network_name = "sh-vnet-100"
    virtual_subnet_name = "sh-sn-300"
    vnet_cidr = "10.10.0.0/16"
    subnet_cidr = "10.30.0.0/24"
}





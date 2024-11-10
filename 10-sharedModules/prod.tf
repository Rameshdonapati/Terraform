module "uatmodule" {
    source = "./modules"
    rglocation = "East US"
    rgname = "app100-RG"
    prefix = "prod"
    virtual_network_name = "sh-vnet-100"
    virtual_subnet_name = "sh-sn-200"
    vnet_cidr = "10.10.0.0/16"
    subnet_cidr = "10.20.0.0/24"
}





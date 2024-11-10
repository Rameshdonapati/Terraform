# link : https://developer.hashicorp.com/terraform/language/backend/azurerm
# if terraform backend is not declared, terraform will take present working directory as directory for statefile to save

#issuesfaced
#error occured with provider last night ,got fixed after system reboot.
#error occured with key. copied and pasted it again properly
#error occured to create container in storage account. created manually. it got fixed


#Refresh the State File
terraform refresh — Modify the state file with updated metadata containing information on the resources being managed in Terraform. Will not modify your infrastructure.

#View Your State File
terraform show — Show the state file in a human-readable format.

#terraform show <path to statefile> — If you want to read a specific state file, you can provide the path to it. If no path is provided, the current state file is shown.

#Manipulate Your State File
#terraform state — One of the following subcommands must be used with this command in order to manipulate the state file.

terraform state list — Lists out all the resources that are tracked in the current state file.

terraform state mv — Move an item in the state, for example, this is useful when you need to tell Terraform that an item has been renamed, e.g. terraform state mv vm1.oldname vm1.newname

terraform state pull > state.tfstate — Get the current state and outputs it to a local file.

terraform state push — Update remote state from the local state file.

terraform state replace-provider hashicorp/azurerm customproviderregistry/azurerm — Replace a provider, useful when switching to using a custom provider registry.

terraform state rm — Remove the specified instance from the state file. Useful when a resource has been manually deleted outside of Terraform.

#terraform state show <resourcename> — Show the specified resource in the state file.
#>
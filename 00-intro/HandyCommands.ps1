#Azure cmds
<#
  $subscription_id = "3d50325d-5aa8-4fec-b449-8d3e59329142"
  #secret_id       = "754b42cf-1007-40ff-90f9-372411a541f1"
  $client_secret   = "Fyb8Q~uOCDBjjVXHT8l.QHLy.jD8gkKYGQOhMaaa"
  $tenant_id       = "d66f66bc-c6b8-47a7-9128-f1f3fb74a468"
  $client_id       = "e0af6d72-dcac-494a-afab-77f87b74f442"
az login --service-principal -u $CLIENT_ID -p $CLIENT_SECRET --tenant $TENANT_ID

#>

<#
    1. terraform init - this will download the necessary pluggins under .terraform
    2. Terraform validate - this will validatethe necessary syntax of configuration files
    3. Create service Principal, save client secret .
    4. go to subscription and give contributor access to Service Principal
    5. run terraform plan and apply
#>
# terraform apply
# terraform destroy 

========================
git
az module
az cli


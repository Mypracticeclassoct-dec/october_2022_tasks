 
 ### Task to create a terraform templtate where *count* is used to create multiple vpc and subnets

---------------------------------------------------------------------------------------------------------

* firstly, create a .tf files in a folder.
    for example :
        1.input.tf
        2.variable.tf
        3.provider.tf
        4.ext.tfvars
-----------------------------------------------------------------------------------------------------
* The providers are defined as per the service you  are using .
* create the variables which are defined in the ext.tfvars file and define their types in the variable.tf file 
* After creating the variables and create the resources ,in this file  we used vpc and subnet resources .
* After creating the required resources and go to powershell and run the command `terraform init ` this command is used to install the terraform in the folder where the files are present .
* After the terraform is installed the use the command `terraform validate ` which will check the file for errors and give us the success output.
* To create the resources in our required cloud service use the command `terraform apply -var-file="ext.tfvars"` or `terraform apply --auto-approve`.
* if the terraform file does not contain any errors and the files execuited in the powershell you can find the resources created in the cloud service .
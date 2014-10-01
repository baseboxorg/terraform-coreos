terraform-coreos
=========
A repo to test a 3 node coreos cluster on AWS

# Prereqs
## Basic stuff
- AWS access and secret keys
- [Terraform](http://terraform.io)

## Things you need to do
- Copy ```terraform.tfvars.example``` to ```terraform.tfvars``` and replace the values (or supply ```-var``` in your command line) 
- Check ```variables.tf``` to ensure you are using the proper AMIs. Right now I have it set to CoreOS-alpha-452.0.0 


## Fire it up
```
./start.sh
```
The reason this works is because it is generating a user-data.yaml for you with a fresh discovery URL for etcd.

# Helpful commands
- Show info about the instances
```terraform show terraform.tfstate```
- Check on your fleetctl cluster
```fleetctl list-machines```
- Check your user-data on an instance
```curl http://169.254.169.254/latest/user-data```

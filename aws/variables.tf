variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "key_name" {}

# CoreOS mappings
# https://coreos.com/docs/running-coreos/cloud-providers/ec2/

variable "amis" {
    default = {
        us-east-1 = "ami-fc60d494"
        us-west-2 = "ami-03de9d33"
        us-west-1 = "ami-2b81896e"
    }
}
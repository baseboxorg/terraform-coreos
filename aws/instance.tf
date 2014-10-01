resource "aws_security_group" "coreos-sg" {
    name = "coreos-sg"
    description = "CoreOS security groups for etcd"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 4001
        to_port = 4001
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 7001
        to_port = 7001
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "docker_host" {
  instance_type = "t1.micro"
  ami = "${lookup(var.amis, var.region)}"
  count = 3
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.coreos-sg.name}"]
  user_data = "${file("user-data.yaml")}"
}

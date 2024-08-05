terraform {
  backend "s3" {
    bucket = "terraform-d75"
    key    = "jenkins/ip/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "instance" {
  instance_id = "i-0698400f65f9f9b2b"
}

resource "aws_route53_record" "jenkins_dns" {
  name    = "jenkins.aligntune.online"
  type    = "A"
  zone_id = "Z03008653NMBFHGJP7YNJ"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}


data "aws_instance" "artifactory" {
  instance_id = "i-0deaf763a522662a7"
}

resource "aws_route53_record" "jenkins_dns" {
  name    = "artifactory.aligntune.online"
  type    = "A"
  zone_id = "Z03008653NMBFHGJP7YNJ"
  records = [data.aws_instance.artifactory.public_ip]
  ttl     = 10
}

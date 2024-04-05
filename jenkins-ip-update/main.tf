terraform {
  backend "s3" {
    bucket = "bpk-terra-state"
    key    = "misc/jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_instance" "jenkins" {
  instance_id = "i-0a7740678d85b3256"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins"
  type    = "A"
  zone_id = "Z0884885ZSESFET2B3ZQ"
  ttl     = 10
  records = [data.aws_instance.jenkins.public_ip]
}
##
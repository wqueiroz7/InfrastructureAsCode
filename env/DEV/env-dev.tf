module "aws-dev-enviroment" {
  source = "../../infra"
  instance_type= "t2.micro"
  aws_region ="us-west-2"
  ssh_key = "IaC-DEV"
}
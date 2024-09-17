bucket_name = "dev-proj-1-remote-state-bucket"
name        = "environment"
environment = "dev-1"

vpc_cidr                    = "10.0.0.0/16"
vpc_name                    = "dev-proj-eu-central-vpc-1"
public_subnet_ipv6_prefixes = [0, 1, 2]
private_subnet_ipv6_prefixes = [3, 4, 5]
cidr_public_subnet          = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
cidr_private_subnet         = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
eu_availability_zone        = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgWLjwwJjbEy3H0IIEoQbD8/a3AMLV0A1FG1WJcOLzY6zFsWCpQYJX2zJp0QqatXVDkXthLnQQQP/9FGblKoWOczlLPosv6YY1Adtb3npAwJpXvJRnM0y0+FHaf0LBzC45ZjMHDxlsZxVNWwBBFW9fWL93XNgFpZ8MtAGtUNcxAqqEU9PKJh1qkP6tzAZzr027KhFAbaMfrtFZW0cQtnYSbU8KP3F/BcbHpH10Xvt7llQahkK9M1WOK/X/+a5vJWuznxqJnFtvajzplUNRM03PZPERc3EZzEUxeOb+u2kS2yjkgwnZO85DNLCiUqMYyeRt/xQSFqLYBbYR2bNYtfB/ rahulwagh@Rahuls-MacBook-Pro-2.local"

ec2_ami_id = "ami-06dd92ecc74fdfb36"

ec2_user_data_install_apache = ""

domain_name = "jhooq.org"
locals{
    ami_id = data.aws_ami.rhel_info.id
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}
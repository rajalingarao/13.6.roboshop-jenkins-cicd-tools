variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "domain_name" {
  type        = string
  default     = "lithesh.shop"
  description = "description"
}

variable "zone_id" {
  type        = string
  default     = "Z012785114HGZTDQ8KSQH"
  description = "description"
}
variable "allow_everything" {
   type = string
   default = "sg-088bbd993cbc52b59"
}
variable "instance_names" {
  description = "List of names for instances"
  type        = list(string)
  default     = ["ansible-control", "web-instance", "app-instance","db-instance"]
}

variable "instance_type" {
  description = "List of names for instances"
  type        = list(string)
  default     = ["t2.medium", "t2.micro", "t2.micro","t2.micro"]
}

variable "vpc_id" {
  default     = "vpc-0a35a83de5d6649ab"
}

variable "key_name" {
  default     = "admin-ajay"
}
variable "ami-id" {
  default     = "ami-05fb0b8c1424f266b"
}
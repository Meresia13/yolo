variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "eu-north-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}
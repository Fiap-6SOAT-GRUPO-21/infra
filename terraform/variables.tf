variable "region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
  type        = string
}

variable "availability_zones" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "List of availability zones for the selected region"
}


variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "project_name" {
  type    = string
  default = "techchallenge"
}

variable "database_credentials" {
  description = "Credentials for database creation"

  type = object({
    username = string
    password = string
    port     = string
    name     = string
  })

  default = {
    username = "postgres"
    password = "postgres"
    port     = 5432
    name     = "api-food"
  }
}
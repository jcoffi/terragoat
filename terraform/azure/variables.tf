variable "subscription_id" {
  type        = string
  description = "The subscription ID to be scanned"
  default     = null
}

variable "location" {
  type    = string
  default = "East US"
}

variable "environment" {
  default     = "dev"
  description = "Must be all lowercase letters or numbers"
}

variable "company_name" {
  default = "acme"
}

locals {
  resource_prefix = {
    value = "${var.company_name}-${var.environment}"
  }
}

variable "dbname" {
  type        = string
  description = "Name of the Database"
  default     = "db1"
}

variable "password" {
  type        = string
  description = "Database password"
  default     = "Aa1234321Bb"
}

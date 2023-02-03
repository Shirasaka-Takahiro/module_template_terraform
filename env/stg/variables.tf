##General Config
variable "general_config" {
  type = map(any)
  default = {
    project = "example"
    env     = "stg"
  }
}

##Regions
variable "regions" {
  default = {
    tokyo    = "ap-northeast-1"
    virginia = "us-east-1"
  }
}

##Network
variable "vpc" {
  description = "CIDR BLOCK for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type = map(any)
  default = {
    availability_zones = {
      az-1a = {
        az = "ap-northeast-1a"
      },
      az-1c = {
        az = "ap-northeast-1c"
      }
    }
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    subnets = {
      public-1a = {
        name = "public-1a",
        cidr = "10.0.10.0/24",
        az   = "ap-northeast-1a"
      },
      public-1c = {
        name = "public-1c",
        cidr = "10.0.30.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    subnets = {
      private-1a = {
        name = "private-1a"
        cidr = "10.0.20.0/24"
        az   = "ap-northeast-1a"
      },
      private-1c = {
        name = "private-1c"
        cidr = "10.0.40.0/24"
        az   = "ap-northeast-1c"
      }
    }
  }
}

##Security Group
variable "operation_sg_source_ip_1" {
  description = "Source IP for operation_sg"
  type        = string
  default     = "0.0.0.0/0"
}

variable "operation_sg_source_ip_2" {
  description = "Source IP for operation_sg"
  type        = string
  default     = "0.0.0.0/0"
}

variable "operation_sg_source_ip_3" {
  description = "Source IP for operation_sg"
  type        = string
  default     = "0.0.0.0/0"
}


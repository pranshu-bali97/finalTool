variable "public-sg-id" {
  type = string
}

variable "private-sg-id" {
  type = string
}

variable "pub-sub-id" {
  type = string  
}

variable "pri-sub-1-id" {
  type = string  
}

variable "pri-sub-2-id" {
  type = string  
}

variable "ami-id" {
  type = string
  default = "ami-005fc0f236362e99f"
}

variable "instance-type" {
  type = string
  default = "t2.large"
}

variable "key-name" {
  type = string
  default = "t"
}

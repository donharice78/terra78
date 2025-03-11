variable region  {
  default = "us-east-1"
}

variable zone1  {
  default = "us-east-1a"
}

variable amiID  {
  type = map
  default = {
    us-east-1 = "ami-04b4f1a9cf54c11d0"
    us-west-2 = "ami-0cb91c7de36eed2cb"
  }
}
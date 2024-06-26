variable "product" {
  type        = string
  nullable    = false
  description = "The name of the product that hosts the environment"
  default     = "marc-gavanier"
}

variable "service" {
  type        = string
  nullable    = false
  description = "The name of the service that will be run on the environment"
  default     = "website"
}

variable "enable_bucket_website" {
  type        = bool
  nullable    = false
  description = "Whether to provide an S3 bucket website configuration"
  default     = false
}

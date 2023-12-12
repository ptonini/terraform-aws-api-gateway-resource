variable "rest_api_id" {}

variable "parent_id" {}

variable "path_part" {}

variable "methods" {
  type = map(object({
    authorization      = optional(string, "NONE")
    authorizer_id      = optional(string)
    request_parameters = optional(any)
    integrations = map(object({
      type               = string
      uri                = string
      connection_type    = optional(string)
      connection_id      = optional(string)
      request_parameters = optional(any)
    }))
  }))
  default  = {}
  nullable = false
}


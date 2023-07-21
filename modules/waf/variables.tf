variable "waf" {
  type = object({
    name                  = string
    description           = string
    kind                  = string
    phase                 = string
    action                = string
    expression            = string
    rule_description      = string
    enabled               = bool
  })
}

variable "zones" {
  description = "List of zone names"
  type        = list(string)
}
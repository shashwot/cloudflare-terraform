variable "waf" {
  type = map(object({
    zone                  = string
    name                  = string
    description           = string
    kind                  = string
    phase                 = string
    action                = string
    expression            = string
    rule_description      = string
    enabled               = bool
  }))
}
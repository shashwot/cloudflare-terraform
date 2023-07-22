variable "zones" {
  description = "List of zone names"
  type        = list(string)
}

variable "aopr_enabled" {
  type    = bool
  default = false
}
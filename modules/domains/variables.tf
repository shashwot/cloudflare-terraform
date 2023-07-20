variable "hosts" {
  type = map(object({
    zone      = string
    name      = string
    values    = string
    type      = string
    proxied   = bool
  }))
}
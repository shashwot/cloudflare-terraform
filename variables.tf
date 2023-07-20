# API Tokens
variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
}


# Zones
variable "zones" {
  description = "List of zone names"
  type        = list(string)
}


variable "hosts" {
  type = map(object({
    zone      = string
    name      = string
    values    = string
    type      = string
    proxied   = bool
  }))
}

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


variable "security" {
  type = map(object({
    zone                      = string
    brotli                    = string
    challenge_ttl             = number
    security_level            = string
    opportunistic_encryption  = string
    automatic_https_rewrites  = string
    mirage                    = string
    waf                       = string
    ssl                       = string
    minify_css                = string
    minify_js                 = string
    minify_html               = string
    security_header_enable    = bool
    always_use_https          = string
    min_tls_version           = string
    security_header_include_subdomain = bool
    security_header_max_age = number
    security_header_no_sniff = bool
    security_header_preload = bool
    }))
}
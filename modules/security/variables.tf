variable "security" {
  type = object({
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
  })
}

variable "zones" {
  description = "List of zone names"
  type        = list(string)
}
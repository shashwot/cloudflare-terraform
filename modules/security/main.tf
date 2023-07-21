data "cloudflare_zone" "this" {
  for_each      = toset(var.zones)
  name          = each.key
}

resource "cloudflare_zone_settings_override" "cd_zone_override" {
  for_each  = data.cloudflare_zone.this
  zone_id   = each.value.id
  settings {
    brotli                   = var.security.brotli
    challenge_ttl            = var.security.challenge_ttl
    security_level           = var.security.security_level
    opportunistic_encryption = var.security.opportunistic_encryption
    automatic_https_rewrites = var.security.automatic_https_rewrites
    mirage                   = var.security.mirage
    waf                      = var.security.waf
    ssl                      = var.security.ssl
    always_use_https         = var.security.always_use_https
    min_tls_version          = var.security.min_tls_version
    minify {
      css  = var.security.minify_css
      js   = var.security.minify_js
      html = var.security.minify_html
    }
    security_header {
      enabled = var.security.security_header_enable
      include_subdomains = var.security.security_header_include_subdomain
      max_age = var.security.security_header_max_age
      nosniff = var.security.security_header_no_sniff
      preload = var.security.security_header_preload
    }
  }
}

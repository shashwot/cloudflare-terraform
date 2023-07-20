data "cloudflare_zone" "this" {
  for_each      = var.security
  name          = each.value.zone
}

resource "cloudflare_zone_settings_override" "cd_zone_override" {
  for_each = var.security
  zone_id = data.cloudflare_zone.this[each.key].id
  settings {
    brotli                   = each.value.brotli
    challenge_ttl            = each.value.challenge_ttl
    security_level           = each.value.security_level
    opportunistic_encryption = each.value.opportunistic_encryption
    automatic_https_rewrites = each.value.automatic_https_rewrites
    mirage                   = each.value.mirage
    waf                      = each.value.waf
    ssl                      = each.value.ssl
    always_use_https         = each.value.always_use_https
    min_tls_version          = each.value.min_tls_version
    minify {
      css  = each.value.minify_css
      js   = each.value.minify_js
      html = each.value.minify_html
    }
    security_header {
      enabled = each.value.security_header_enable
      include_subdomains = each.value.security_header_include_subdomain
      max_age = each.value.security_header_max_age
      nosniff = each.value.security_header_no_sniff
      preload = each.value.security_header_preload
    }
  }
}
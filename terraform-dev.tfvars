# Tokens
cloudflare_api_token  = "agrnW2Yf-Syo4XGiBYWNno8HWyQ6B8UqKqMq1M2"
cloudflare_account_id = "8bejuv79fbf9f6r93bdksdfye8340hsdfof75"

# Create Hosted Zones
zones = ["example.tf", "example2.tf"]

aopr_enabled = true

# Configure Domains
hosts = {
  "secure.example.tf" = {
    zone      = "example.tf"
    name      = "secure"
    values    = "1.2.3.4"
    type      = "A"
    proxied   = true
  },
  "secure.example1.tf" = {
    zone      = "example2.tf"
    name      = "secure"
    values    = "1.2.3.4"
    type      = "A"
    proxied   = true
  },
  "test.example.tf" = {
    zone      = "example.tf"
    name      = "test"
    values    = "1.2.3.5"
    type      = "A"
    proxied   = true
  }
}

# WAF - Block Bots 
waf = {
  name                  = "Block_Bots_findthetracking"
  description           = "Block Known Bots"
  kind                  = "zone"
  phase                 = "http_request_firewall_custom"
  action                = "block"
  expression            = "(cf.client.bot)"
  rule_description      = "Block_Bots"
  enabled               = true
}


# Enable Security
security = {
    brotli                    = "on"
    challenge_ttl             = 2700
    security_level            = "high"
    opportunistic_encryption  = "on"
    automatic_https_rewrites  = "on"
    mirage                    = null
    waf                       = null
    ssl                       = "strict"
    minify_css                = "on"
    minify_js                 = "on"
    minify_html               = "on"
    always_use_https          = "on"
    min_tls_version           = "1.2"
    security_header_enable    = true
    security_header_include_subdomain = true
    security_header_max_age   = 31536000
    security_header_no_sniff  = true
    security_header_preload   = true
}
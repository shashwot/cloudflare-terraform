data "cloudflare_zone" "this" {
  for_each      = toset(var.zones)
  name          = each.key
}

resource "cloudflare_ruleset" "zone_custom_firewall" {
  for_each    = data.cloudflare_zone.this
  zone_id     = each.value.id
  name        = var.waf.name
  description = var.waf.description
  kind        = var.waf.kind
  phase       = var.waf.phase

  rules {
    action      = var.waf.action
    expression  = var.waf.expression
    description = var.waf.rule_description
    enabled     = var.waf.enabled
  }
}

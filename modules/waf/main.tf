data "cloudflare_zone" "this" {
  for_each      = var.waf
  name          = each.value.zone
}

resource "cloudflare_ruleset" "zone_custom_firewall" {
  for_each    = var.waf
  zone_id     = data.cloudflare_zone.this[each.key].id
  name        = each.value.name
  description = each.value.description
  kind        = each.value.kind
  phase       = each.value.phase

  rules {
    action      = each.value.action
    expression  = each.value.expression
    description = each.value.rule_description
    enabled     = each.value.enabled
  }
}

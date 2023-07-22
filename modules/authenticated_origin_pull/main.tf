data "cloudflare_zone" "this" {
  for_each      = toset(var.zones)
  name          = each.key
}

resource "cloudflare_authenticated_origin_pulls" "domains" {
  for_each    = data.cloudflare_zone.this
  zone_id     = each.value.id
  enabled     = var.aopr_enabled ? true : false
}

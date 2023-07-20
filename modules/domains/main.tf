data "cloudflare_zone" "this" {
  for_each      = var.hosts
  name          = each.value.zone
}

resource "cloudflare_record" "dns_records" {
  for_each      = var.hosts
  name          = each.value.name
  zone_id       = data.cloudflare_zone.this[each.key].id
  value         = each.value.values
  type          = each.value.type
  proxied       = each.value.proxied 
}

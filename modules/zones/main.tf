resource "cloudflare_zone" "zones" {
  for_each   = toset(var.zones)
  zone       = each.value
  account_id = var.cloudflare_account_id
}

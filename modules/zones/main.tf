resource "cloudflare_zone" "zones" {
  count = length(var.zones)
  zone  = var.zones[count.index]
  account_id =  var.cloudflare_account_id
}


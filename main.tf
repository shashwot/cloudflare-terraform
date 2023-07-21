
module "zones" {
  source = "./modules/zones"

  zones = var.zones
  cloudflare_account_id = var.cloudflare_account_id
}

module "domains" {
  source  = "./modules/domains"

  hosts   = var.hosts
  depends_on = [
    module.zones
  ]
}


module "waf" {
  source  = "./modules/waf"
  
  zones = var.zones
  waf     = var.waf
  depends_on = [
    module.zones
  ]
}


module "security" {
  source  = "./modules/security"

  zones = var.zones
  security = var.security
  depends_on = [
    module.zones
  ]
}

locals {
  product_information = {
    context : {
      product    = var.product
      service    = var.service
      start_date = "2022-04-01"
      end_date   = "unknown"
    }
    purpose : {
      disaster_recovery = "medium"
      service_class     = "bronze"
    }
    organization : {
      client = "marc.gavanier"
    }
    stakeholders : {
      business_owner  = "marc.gavanier@gmail.com"
      technical_owner = "marc.gavanier@gmail.com"
      approver        = "marc.gavanier@gmail.com"
      creator         = "terraform"
      team            = "marc-gavanier"
    }
  }
}

locals {
  productTitle = title(replace(local.product_information.context.product, "_", " "))
  serviceTitle = title(replace(local.product_information.context.service, "_", " "))
}

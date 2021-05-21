variable subscriptionId {
    type = string
}

variable clientId {
    type = string
}

variable clientSecret {
    type = string    
}

variable tenantID {
    type = string
}

variable "strName" {
  type = string
}

variable "location" {
  type    = string  
  default = "eastus"
}

variable "rgName" {
  type = string
  default = "knowledge-mining-demo-rg"
}

variable "searchName" {
  type = string  
}
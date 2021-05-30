param locations string
param suffix string

var srvBusName = 'srvbus-${suffix}'

resource busNamespace 'Microsoft.ServiceBus/namespaces@2017-04-01' = {
  name: srvBusName
  location: locations
  sku: {
    name: 'Standard'
  }
  properties: {}
}

resource serviceBusTopic 'Microsoft.ServiceBus/namespaces/topics@2017-04-01' = {
  name: '${busNamespace.name}/CV'
  properties: {    
  }  
}

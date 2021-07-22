param location string
param suffix string

resource search 'Microsoft.Search/searchServices@2020-08-01' = {
  name: 'search-${suffix}'
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

resource cognitiveService 'Microsoft.CognitiveServices/accounts@2017-04-18' = {
  name: 'cognitive-${suffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'CognitiveServices'
}

output searchServiceName string = search.name
output searchApiKey string = listAdminKeys(search.name,'2021-04-01-preview').primaryKey
output cognitiveApiKey string = listKeys(cognitiveService.name,'2021-04-30').key1

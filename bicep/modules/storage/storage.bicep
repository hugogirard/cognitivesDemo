param location string
param suffix string

var name = 'str${suffix}'
var containerName = 'resume'

resource str 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${str.name}/default/${containerName}'
}

output strCnxString string = listkey(str.id,'2019-04-01').keys[0].value
output containerName string = containerName

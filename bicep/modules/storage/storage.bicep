param location string
param suffix string

var name = 'str${suffix}'
var containerEngName = 'resume'
var containerFrName = 'resumefr'

resource str 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${str.name}/default/${containerEngName}'
}

resource containerFr 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${str.name}/default/${containerFrName}'
}

output strCnxString string = 'DefaultEndpointsProtocol=https;AccountName=${str.name};AccountKey=${listKeys(str.id,'2019-04-01').keys[0].value};EndpointSuffix=core.windows.net'
output strName string = str.name
output strId string = str.id
output containerEnglish string = containerEngName
output containerFrench string = containerFrName

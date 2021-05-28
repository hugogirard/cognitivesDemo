param location string
param suffix string

var name = 'str${suffix}'
var nameStrFunc = 'strf${suffix}'
var containerName = 'resume'
var containerFrName = 'resume_fr'
var containerEnglish = 'resume_eng'

resource str 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
}

resource strFunction 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: nameStrFunc
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

resource containerFr 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${str.name}/default/${containerFrName}'
}

resource containerEng 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${str.name}/default/${containerEnglish}'
}

output strCnxString string = listKeys(str.id,'2019-04-01').keys[0].value
output containerName string = containerName

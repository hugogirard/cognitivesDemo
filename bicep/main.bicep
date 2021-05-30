param location string

var suffix = uniqueString(resourceGroup().id)

module str 'modules/storage/storage.bicep' = {
  name: 'str'
  params: {
    location: location
    suffix: suffix
  }
}

module cognitive 'modules/cognitive/cognitive.bicep' = {
  name: 'cognitives'
  params: {
    location: location
    suffix: suffix
  }
}


output strCnxString string = str.outputs.strCnxString
output containerName string = str.outputs.containerName
output strName string = str.outputs.strName
output storageId string = str.outputs.strId
output suffix string = suffix

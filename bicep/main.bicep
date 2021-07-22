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


output searchServiceName string = cognitive.outputs.searchServiceName
output strCnxString string = str.outputs.strCnxString
output strName string = str.outputs.strName
output containerFrench string = str.outputs.containerFrench
output containerEnglish string = str.outputs.containerEnglish
output searchServiceAdminKey string = cognitive.outputs.searchApiKey
output cognitiveServiceKey string = cognitive.outputs.cognitiveApiKey


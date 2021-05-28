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

module function 'modules/function/function.bicep' = {
  name: 'function'
  params: {
    location: location
    suffix: suffix
    strKey: str.outputs.strCnsStringFunc
    strName: str.outputs.strFuncName
  }
}

output strCnxString string = str.outputs.strCnxString
output containerName string = str.outputs.containerName

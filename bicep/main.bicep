param location string

var suffix = uniqueString(resourceGroup().id)

module str 'modules/storage/storage.bicep' = {
  name: 'str'
  params: {
    location: location
    suffix: suffix
  }
}

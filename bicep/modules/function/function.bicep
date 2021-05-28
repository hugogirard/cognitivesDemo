param location string
param suffix string
param strName string
param strKey string

var planName = 'plan-func-${suffix}'
var funcName = 'func-${suffix}'
var workspaceName = 'work-${suffix}'
var appInsightName = 'func-insight-${suffix}'

resource workspace 'Microsoft.OperationalInsights/workspaces@2017-03-15-preview' = {
  name: workspaceName
  location: location
  properties: {    
    sku: {
      name: 'pergb2018'
    }
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02-preview' = {
  name: appInsightName
  location: location
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: workspace.id
  }  
}

resource plan 'Microsoft.Web/serverfarms@2018-11-01' = {
  name: planName
  location: location
  properties: {
    name: planName
    workerSize: 3
    workerSizeId: 3
    numberOfWorkers: 1
    maximumElasticWorkerCount: 20
  }
  sku: {
    Tier: 'ElasticPremium'
    Name: 'EP1'
  }
}

resource func 'Microsoft.Web/sites@2018-11-01' = {
  name: funcName
  location: location
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~3'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${strName};AccountKey=${strKey};EndpointSuffix=core.windows.net'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=${strName};AccountKey=${strKey};EndpointSuffix=core.windows.net'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: '${funcName}a8dd'
        }
      ]
    }
    serverFarmId: plan.id    
  }
}

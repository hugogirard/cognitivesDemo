param (
    [Parameter(Mandatory=$true)]
    [string]$searchServiceName,
    [Parameter(Mandatory=$true)]
    [string]$apiKey
)

try {
    Invoke-WebRequest -Method DELETE -Headers @{ 'api-key' = $apiKey } -Uri "https://$searchServiceName.search.windows.net/datasources/resumesource?api-version=2020-06-30"
}
catch {
    Write-Host "No datasource to delete"
}

$body = Get-Content "datasource.json"

Invoke-WebRequest -Method POST -ContentType 'application/json' -Headers @{ 'api-key' = $apiKey } -Uri "https://$searchServiceName.search.windows.net/datasources?api-version=2020-06-30" -Body $body
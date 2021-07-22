#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Illegal number of parametes"
  exit 500
fi

searchServiceName=$1
apiKey=$2
cnxStringStorage=$3

# Delete previous configuration
curl -H "Content-Type: application/json" -H "api-key: $apiKey" -X DELETE "https://$searchServiceName.search.windows.net/datasources/resumesource?api-version=2020-06-30"

curl -d "@datasource.json" -H "Content-Type: application/json" -H "api-key: $apiKey" -X POST "https://$searchServiceName.search.windows.net/datasources?api-version=2020-06-30"
#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Illegal number of parametes"
  exit 500
fi

searchServiceName=$1
apiKey=$2
cnxStringStorage=$3

curl -d "@datasource.json" -X POST "https://$searchServiceName.search.windows.net/datasources?api-version=2020-06-30"
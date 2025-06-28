#!/usr/bin/env bash

# Get all banks in Spain
COUNTRY=es
response=$(curl -s -X GET "https://bankaccountdata.gocardless.com/api/v2/institutions/?country=$COUNTRY" \
  -H  "accept: application/json" \
  -H  "Authorization: Bearer $GOCARDLESS_ACCESS_TOKEN")

jq -r '' <<< "$response"
# institutions=$(jq -r '' <<< "$response")
# 
# echo $institutions

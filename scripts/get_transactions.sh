#!/usr/bin/env bash

response=$(curl -s -X GET "https://bankaccountdata.gocardless.com/api/v2/accounts/${ACCOUNT_ID}/transactions/" \
  -H  "accept: application/json" \
  -H  "Authorization: Bearer $GOCARDLESS_ACCESS_TOKEN"
)

jq -r '' <<< "$response" > $(date +"%Y%m%d_%H%M%S")_transactions.json

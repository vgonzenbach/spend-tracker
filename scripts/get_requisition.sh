#!/usr/bin/env bash

# export INSTITUTION_ID=SANDBOXFINANCE_SFIN0000
export INSTITUTION_ID=CAIXABANK_CAIXESBB

# curl -X POST "https://bankaccountdata.gocardless.com/api/v2/agreements/enduser/" \
#   -H  "accept: application/json" \
#   -H  "Content-Type: application/json" \
#   -H  "Authorization: Bearer $GOCARDLESS_ACCESS_TOKEN" \
#   -d "{\"institution_id\": \"$INSTITUITON_ID\",
#        \"max_historical_days\": \"90\",
#        \"access_valid_for_days\": \"30\",
#        \"access_scope\": [\"balances\", \"details\", \"transactions\"] }"

response=$(curl -s -X POST "https://bankaccountdata.gocardless.com/api/v2/requisitions/" \
  -H  "accept: application/json" -H  "Content-Type: application/json" \
  -H  "Authorization: Bearer $GOCARDLESS_ACCESS_TOKEN" \
  -d "{\"redirect\": \"http://www.yourwebpage.com\",
       \"institution_id\": \"$INSTITUTION_ID\",
        \"user_language\":\"EN\" }"
)

# Save requisition ID
requisition_id=$(jq -r '.id' <<< "$response")

echo "Requisition ID: $requisition_id" > $(date +"%Y%m%d_%H%M%S")_requisition_id.txt

jq -r '' <<< "$response"
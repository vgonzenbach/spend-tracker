#!/usr/bin/env bash

REQUISITION_ID=a30b175c-a526-4884-9152-974d82df4fde

response=$(curl -s -X GET "https://bankaccountdata.gocardless.com/api/v2/requisitions/${REQUISITION_ID}/" \
  -H  "accept: application/json" \
  -H  "Authorization: Bearer $GOCARDLESS_ACCESS_TOKEN"
)

export ACCOUNT_ID=$(jq -r '.accounts[0]' <<< "$response")
jq -r '' <<< "$response"
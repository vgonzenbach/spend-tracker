import requests

# Replace with your actual credentials and details
API_KEY = 'YOUR_NORDIGEN_API_KEY'
BASE_URL = 'https://ob.nordigen.com/api/v2/'
ACCOUNT_ID = 'YOUR_CAIXABANK_ACCOUNT_ID'
START_DATE = '2024-01-01'  # ISO 8601 format
END_DATE = '2024-01-31'

# Step 1: Get access token
token_url = BASE_URL + 'token/new/'
headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
}
data = {'secret_id': API_KEY}
token_response = requests.post(token_url, headers=headers, json=data)
token_response.raise_for_status()  # Ensure no errors
access_token = token_response.json()['access']

# Step 2: Retrieve transactions within the date range
transactions_url = BASE_URL + f'accounts/{ACCOUNT_ID}/transactions/'
params = {
    'date_from': START_DATE,
    'date_to': END_DATE
}
headers = {
    'Accept': 'application/json',
    'Authorization': f'Bearer {access_token}'
}
trans_response = requests.get(transactions_url, headers=headers, params=params)
trans_response.raise_for_status()
transactions = trans_response.json()

print(transactions)


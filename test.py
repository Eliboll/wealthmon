
import requests
import json

with open("accesstoken", "r") as fp:
    access_url = fp.read()
    fp.close()

# 3. Get some data
scheme, rest = access_url.split('//', 1)
auth, rest = rest.split('@', 1)
url = scheme + '//' + rest + '/accounts'
username, password = auth.split(':', 1)

response = requests.get(url, auth=(username, password))
data = response.json()
with open("response.json", "w") as fp:
    json.dump(data,fp)
for account in data['accounts']:
    pass
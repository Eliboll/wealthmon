import base64
import requests

TOKEN = ""

decoded_bytes = base64.b64decode(TOKEN)
claim_url = decoded_bytes.decode('utf-8')

response = requests.post(claim_url)
access_url = response.text

with open("accesstoken", "w") as fp:
    fp.write(access_url)
    fp.close()
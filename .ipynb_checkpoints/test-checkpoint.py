from googleapiclient import discovery
import json
import httplib2

proxy_info = httplib2.ProxyInfo(proxy_type=httplib2.socks.PROXY_TYPE_HTTP, proxy_host="127.0.0.1", proxy_port=7890)
http = httplib2.Http(timeout=10, proxy_info=proxy_info, disable_ssl_certificate_validation=False)

API_KEY = 'AIzaSyD_L3I9bsB-x5GSJfFjJ9gx7GXwNJyVIW0'

client = discovery.build(
    "commentanalyzer",
    "v1alpha1",
    developerKey=API_KEY,
    discoveryServiceUrl="https://commentanalyzer.googleapis.com/$discovery/rest?version=v1alpha1",
    static_discovery=False,
    http=http
)

analyze_request = {
    'comment': {'text': 'friendly greetings from python'},
    'requestedAttributes': {'TOXICITY': {}}
}

response = client.comments().analyze(body=analyze_request).execute()
print(json.dumps(response, indent=2))

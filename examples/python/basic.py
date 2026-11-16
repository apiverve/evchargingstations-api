"""
EV Charging Stations API - Basic Usage Example

This example demonstrates the basic usage of the EV Charging Stations API.
API Documentation: https://docs.apiverve.com/ref/evchargingstations
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/evchargingstations'

def call_evchargingstations_api():
    """
    Make a GET request to the EV Charging Stations API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;lat&#x27;: 37.7749, &#x27;lon&#x27;: -122.4194, &#x27;zip&#x27;: &#x27;10001&#x27;, &#x27;city&#x27;: &#x27;Toronto&#x27;, &#x27;state&#x27;: &#x27;ON&#x27;, &#x27;radius&#x27;: 10, &#x27;connector&#x27;: &#x27;ccs&#x27;, &#x27;network&#x27;: &#x27;Tesla&#x27;, &#x27;level&#x27;: &#x27;2&#x27;, &#x27;fastOnly&#x27;: true, &#x27;access&#x27;: &#x27;public&#x27;, &#x27;status&#x27;: &#x27;open&#x27;, &#x27;limit&#x27;: 20}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling EV Charging Stations API...\n')

    result = call_evchargingstations_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')

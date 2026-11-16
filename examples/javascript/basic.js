/**
 * EV Charging Stations API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the EV Charging Stations API.
 * API Documentation: https://docs.apiverve.com/ref/evchargingstations
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/evchargingstations';

/**
 * Make a GET request to the EV Charging Stations API
 */
async function callEVChargingStationsAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            lat: 37.7749,
            lon: -122.4194,
            zip: &#x27;10001&#x27;,
            city: &#x27;Toronto&#x27;,
            state: &#x27;ON&#x27;,
            radius: 10,
            connector: &#x27;ccs&#x27;,
            network: &#x27;Tesla&#x27;,
            level: &#x27;2&#x27;,
            fastOnly: true,
            access: &#x27;public&#x27;,
            status: &#x27;open&#x27;,
            limit: 20
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callEVChargingStationsAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });

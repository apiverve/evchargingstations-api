/**
 * Basic Example - EV Charging Stations API
 *
 * This example demonstrates how to use the EV Charging Stations API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const evchargingstationsAPI = require('../index.js');

// Initialize the API client
const api = new evchargingstationsAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  lat: 37.7749,
  lon: -122.4194,
  zip: "10001",
  city: "Toronto",
  state: "ON",
  radius: 10,
  connector: "ccs",
  network: "Tesla",
  level: "2",
  fastOnly: false,
  access: "public",
  status: "open",
  limit: 20
};

// Make the API request using callback
console.log('Making request to EV Charging Stations API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});

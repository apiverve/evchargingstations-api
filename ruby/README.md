# EV Charging Stations API - Ruby Gem

EV Charging Stations finds electric vehicle charging stations within a radius of a point, a ZIP or postal code, or a city, across the US and Canada, sorted by distance. Each station returns its address, coordinates, distance, status, access, network, Level 1, Level 2 and DC fast port counts and connector types. Filter by connector, network, charging level or fast charging only. Paid plans add charging power in kW, pricing, access hours, phone, facility type and open dates.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_evchargingstations'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_evchargingstations
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_evchargingstations'

# Initialize the client
client = APIVerve::Evchargingstations::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  lat: 37.7749,
  lon: -122.4194,
  zip: "10001",
  city: "Toronto",
  state: "ON",
  radius: 10,
  connector: "ccs",
  network: "Tesla",
  level: "2",
  fastOnly: true,
  access: "public",
  status: "open",
  limit: 20
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ lat: 37.7749, lon: -122.4194, zip: "10001", city: "Toronto", state: "ON", radius: 10, connector: "ccs", network: "Tesla", level: "2", fastOnly: true, access: "public", status: "open", limit: 20 })
  puts response["data"]
rescue APIVerve::Evchargingstations::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Evchargingstations::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Evchargingstations::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "count": 16,
    "returned": 2,
    "searchCenter": {
      "latitude": 37.7749,
      "longitude": -122.4194,
      "source": "coordinates"
    },
    "radiusKm": 2,
    "stations": [
      {
        "name": "HUDSON PACIFIC 1455 LOBBY 2",
        "status": "open",
        "access": "public",
        "address": {
          "street": "1455 Market St",
          "city": "San Francisco",
          "state": "CA",
          "zip": "94103",
          "country": "US"
        },
        "latitude": 37.775747,
        "longitude": -122.418214,
        "distanceKm": 0.14,
        "distanceMiles": 0.09,
        "network": "ChargePoint Network",
        "ports": {
          "level1": 0,
          "level2": 0,
          "dcFast": 1,
          "total": 1
        },
        "fastCharging": true,
        "connectors": [
          {
            "type": "chademo",
            "name": "CHAdeMO",
            "level": "dc_fast",
            "ports": 1,
            "maxPowerKw": 62.5
          },
          {
            "type": "ccs",
            "name": "CCS1 (J1772 Combo)",
            "level": "dc_fast",
            "ports": 1,
            "maxPowerKw": 62
          }
        ],
        "maxPowerKw": 62.5,
        "accessHours": "24 hours daily",
        "pricing": null,
        "facilityType": null,
        "phone": "888-758-4389",
        "networkWebsite": "https://www.chargepoint.com",
        "openDate": "2022-11-18",
        "expectedOpenDate": null,
        "lastConfirmed": "2026-11-14"
      },
      {
        "name": "HUDSON PACIFIC 1455 LOBBY 1",
        "status": "open",
        "access": "public",
        "address": {
          "street": "1455 Market St",
          "city": "San Francisco",
          "state": "CA",
          "zip": "94103",
          "country": "US"
        },
        "latitude": 37.775745,
        "longitude": -122.418191,
        "distanceKm": 0.14,
        "distanceMiles": 0.09,
        "network": "ChargePoint Network",
        "ports": {
          "level1": 0,
          "level2": 0,
          "dcFast": 1,
          "total": 1
        },
        "fastCharging": true,
        "connectors": [
          {
            "type": "chademo",
            "name": "CHAdeMO",
            "level": "dc_fast",
            "ports": 1,
            "maxPowerKw": 62.5
          },
          {
            "type": "ccs",
            "name": "CCS1 (J1772 Combo)",
            "level": "dc_fast",
            "ports": 1,
            "maxPowerKw": 62
          }
        ],
        "maxPowerKw": 62.5,
        "accessHours": "24 hours daily",
        "pricing": null,
        "facilityType": null,
        "phone": "888-758-4389",
        "networkWebsite": "https://www.chargepoint.com",
        "openDate": "2022-11-18",
        "expectedOpenDate": null,
        "lastConfirmed": "2026-11-14"
      }
    ]
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/evchargingstations?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/evchargingstations?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/evchargingstations?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).

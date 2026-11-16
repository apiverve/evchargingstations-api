# EV Charging Stations API - PHP Package

EV Charging Stations finds electric vehicle charging stations within a radius of a point, a ZIP or postal code, or a city, across the US and Canada, sorted by distance. Each station returns its address, coordinates, distance, status, access, network, Level 1, Level 2 and DC fast port counts and connector types. Filter by connector, network, charging level or fast charging only. Paid plans add charging power in kW, pricing, access hours, phone, facility type and open dates.

## Installation

Install via Composer:

```bash
composer require apiverve/evchargingstations
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Evchargingstations\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'lat' => 37.7749,
    'lon' => -122.4194,
    'zip' => '10001',
    'city' => 'Toronto',
    'state' => 'ON',
    'radius' => 10,
    'connector' => 'ccs',
    'network' => 'Tesla',
    'level' => '2',
    'fastOnly' => true,
    'access' => 'public',
    'status' => 'open',
    'limit' => 20
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Evchargingstations\Client;
use APIVerve\Evchargingstations\Exceptions\APIException;
use APIVerve\Evchargingstations\Exceptions\ValidationException;

try {
    $response = $client->execute(['lat' => 37.7749, 'lon' => -122.4194, 'zip' => '10001', 'city' => 'Toronto', 'state' => 'ON', 'radius' => 10, 'connector' => 'ccs', 'network' => 'Tesla', 'level' => '2', 'fastOnly' => true, 'access' => 'public', 'status' => 'open', 'limit' => 20]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/evchargingstations?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/evchargingstations?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/evchargingstations?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).

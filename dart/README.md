# EV Charging Stations API - Dart/Flutter Client

EV Charging Stations finds electric vehicle charging stations within a radius of a point, a ZIP or postal code, or a city, across the US and Canada, sorted by distance. Each station returns its address, coordinates, distance, status, access, network, Level 1, Level 2 and DC fast port counts and connector types. Filter by connector, network, charging level or fast charging only. Paid plans add charging power in kW, pricing, access hours, phone, facility type and open dates.

[![pub package](https://img.shields.io/pub/v/apiverve_evchargingstations.svg)](https://pub.dev/packages/apiverve_evchargingstations)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [EV Charging Stations API](https://apiverve.com/marketplace/evchargingstations?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_evchargingstations: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_evchargingstations/apiverve_evchargingstations.dart';

void main() async {
  final client = EvchargingstationsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'lat': 37.7749,
      'lon': -122.4194,
      'zip': '10001',
      'city': 'Toronto',
      'state': 'ON',
      'radius': 10,
      'connector': 'ccs',
      'network': 'Tesla',
      'level': '2',
      'fastOnly': true,
      'access': 'public',
      'status': 'open',
      'limit': 20
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [EV Charging Stations API](https://apiverve.com/marketplace/evchargingstations?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/evchargingstations](https://docs.apiverve.com/ref/evchargingstations?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)

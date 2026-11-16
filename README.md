# [EV Charging Stations API](https://apiverve.com/marketplace/evchargingstations?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

EV Charging Stations finds electric vehicle charging stations within a radius of a point, a ZIP or postal code, or a city, across the US and Canada, sorted by distance. Each station returns its address, coordinates, distance, status, access, network, Level 1, Level 2 and DC fast port counts and connector types. Filter by connector, network, charging level or fast charging only. Paid plans add charging power in kW, pricing, access hours, phone, facility type and open dates.

The EV Charging Stations API provides a simple, reliable way to integrate ev charging stations functionality into your applications. Built for developers who need production-ready ev charging stations capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/evchargingstations?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/evchargingstations?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/evchargingstations)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.EVChargingStations)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-evchargingstations/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_evchargingstations)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/evchargingstations)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_evchargingstations)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callEVChargingStationsAPI() {
    try {
        const params = new URLSearchParams({
            lat: 37.7749,
            lon: -122.4194,
            zip: '10001',
            city: 'Toronto',
            state: 'ON',
            radius: 10,
            connector: 'ccs',
            network: 'Tesla',
            level: '2',
            fastOnly: true,
            access: 'public',
            status: 'open',
            limit: 20
        });

        const response = await fetch(`https://api.apiverve.com/v1/evchargingstations?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callEVChargingStationsAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/evchargingstations?lat=37.7749&lon=-122.4194&zip=10001&city=Toronto&state=ON&radius=10&connector=ccs&network=Tesla&level=2&fastOnly=true&access=public&status=open&limit=20" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/evchargingstations
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/evchargingstations) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.EVChargingStations
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.EVChargingStations) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-evchargingstations
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-evchargingstations/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_evchargingstations
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_evchargingstations) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/evchargingstations
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/evchargingstations) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_evchargingstations
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_evchargingstations) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:evchargingstations-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/evchargingstations-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [EV Charging Stations API](https://apiverve.com/marketplace/evchargingstations?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/evchargingstations](https://docs.apiverve.com/ref/evchargingstations)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The EV Charging Stations API is commonly used for:

- **Web Applications** - Add ev charging stations features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with ev charging stations capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the EV Charging Stations API:

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

---

## Support & Community

- 🏠 **API Home**: [EV Charging Stations API](https://apiverve.com/marketplace/evchargingstations?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.

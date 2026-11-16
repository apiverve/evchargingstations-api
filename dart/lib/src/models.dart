/// Response models for the EV Charging Stations API.

/// API Response wrapper.
class EvchargingstationsResponse {
  final String status;
  final dynamic error;
  final EvchargingstationsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  EvchargingstationsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory EvchargingstationsResponse.fromJson(Map<String, dynamic> json) => EvchargingstationsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? EvchargingstationsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the EV Charging Stations API.

class EvchargingstationsData {
  num? count;
  num? returned;
  EvchargingstationsDataSearchcenter? searchCenter;
  num? radiusKm;
  List<EvchargingstationsDataStationsItem>? stations;

  EvchargingstationsData({
    this.count,
    this.returned,
    this.searchCenter,
    this.radiusKm,
    this.stations,
  });

  factory EvchargingstationsData.fromJson(Map<String, dynamic> json) => EvchargingstationsData(
      count: json['count'],
      returned: json['returned'],
      searchCenter: json['searchCenter'] != null ? EvchargingstationsDataSearchcenter.fromJson(json['searchCenter']) : null,
      radiusKm: json['radiusKm'],
      stations: (json['stations'] as List?)?.map((e) => EvchargingstationsDataStationsItem.fromJson(e)).toList(),
    );
}

class EvchargingstationsDataSearchcenter {
  num? latitude;
  num? longitude;
  String? source;

  EvchargingstationsDataSearchcenter({
    this.latitude,
    this.longitude,
    this.source,
  });

  factory EvchargingstationsDataSearchcenter.fromJson(Map<String, dynamic> json) => EvchargingstationsDataSearchcenter(
      latitude: json['latitude'],
      longitude: json['longitude'],
      source: json['source'],
    );
}

class EvchargingstationsDataStationsItem {
  String? name;
  String? status;
  String? access;
  EvchargingstationsDataStationsItemAddress? address;
  num? latitude;
  num? longitude;
  num? distanceKm;
  num? distanceMiles;
  String? network;
  EvchargingstationsDataStationsItemPorts? ports;
  bool? fastCharging;
  List<EvchargingstationsDataStationsItemConnectorsItem>? connectors;
  num? maxPowerKw;
  String? accessHours;
  dynamic pricing;
  dynamic facilityType;
  String? phone;
  String? networkWebsite;
  String? openDate;
  dynamic expectedOpenDate;
  String? lastConfirmed;

  EvchargingstationsDataStationsItem({
    this.name,
    this.status,
    this.access,
    this.address,
    this.latitude,
    this.longitude,
    this.distanceKm,
    this.distanceMiles,
    this.network,
    this.ports,
    this.fastCharging,
    this.connectors,
    this.maxPowerKw,
    this.accessHours,
    this.pricing,
    this.facilityType,
    this.phone,
    this.networkWebsite,
    this.openDate,
    this.expectedOpenDate,
    this.lastConfirmed,
  });

  factory EvchargingstationsDataStationsItem.fromJson(Map<String, dynamic> json) => EvchargingstationsDataStationsItem(
      name: json['name'],
      status: json['status'],
      access: json['access'],
      address: json['address'] != null ? EvchargingstationsDataStationsItemAddress.fromJson(json['address']) : null,
      latitude: json['latitude'],
      longitude: json['longitude'],
      distanceKm: json['distanceKm'],
      distanceMiles: json['distanceMiles'],
      network: json['network'],
      ports: json['ports'] != null ? EvchargingstationsDataStationsItemPorts.fromJson(json['ports']) : null,
      fastCharging: json['fastCharging'],
      connectors: (json['connectors'] as List?)?.map((e) => EvchargingstationsDataStationsItemConnectorsItem.fromJson(e)).toList(),
      maxPowerKw: json['maxPowerKw'],
      accessHours: json['accessHours'],
      pricing: json['pricing'],
      facilityType: json['facilityType'],
      phone: json['phone'],
      networkWebsite: json['networkWebsite'],
      openDate: json['openDate'],
      expectedOpenDate: json['expectedOpenDate'],
      lastConfirmed: json['lastConfirmed'],
    );
}

class EvchargingstationsDataStationsItemAddress {
  String? street;
  String? city;
  String? state;
  String? zip;
  String? country;

  EvchargingstationsDataStationsItemAddress({
    this.street,
    this.city,
    this.state,
    this.zip,
    this.country,
  });

  factory EvchargingstationsDataStationsItemAddress.fromJson(Map<String, dynamic> json) => EvchargingstationsDataStationsItemAddress(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      country: json['country'],
    );
}

class EvchargingstationsDataStationsItemPorts {
  num? level1;
  num? level2;
  num? dcFast;
  num? total;

  EvchargingstationsDataStationsItemPorts({
    this.level1,
    this.level2,
    this.dcFast,
    this.total,
  });

  factory EvchargingstationsDataStationsItemPorts.fromJson(Map<String, dynamic> json) => EvchargingstationsDataStationsItemPorts(
      level1: json['level1'],
      level2: json['level2'],
      dcFast: json['dcFast'],
      total: json['total'],
    );
}

class EvchargingstationsDataStationsItemConnectorsItem {
  String? type;
  String? name;
  String? level;
  num? ports;
  num? maxPowerKw;

  EvchargingstationsDataStationsItemConnectorsItem({
    this.type,
    this.name,
    this.level,
    this.ports,
    this.maxPowerKw,
  });

  factory EvchargingstationsDataStationsItemConnectorsItem.fromJson(Map<String, dynamic> json) => EvchargingstationsDataStationsItemConnectorsItem(
      type: json['type'],
      name: json['name'],
      level: json['level'],
      ports: json['ports'],
      maxPowerKw: json['maxPowerKw'],
    );
}

class EvchargingstationsRequest {
  double? lat;
  double? lon;
  String? zip;
  String? city;
  String? state;
  double? radius;
  String? connector;
  String? network;
  String? level;
  bool? fastOnly;
  String? access;
  String? status;
  int? limit;

  EvchargingstationsRequest({
    this.lat,
    this.lon,
    this.zip,
    this.city,
    this.state,
    this.radius,
    this.connector,
    this.network,
    this.level,
    this.fastOnly,
    this.access,
    this.status,
    this.limit,
  });

  Map<String, dynamic> toJson() => {
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
      if (zip != null) 'zip': zip,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (radius != null) 'radius': radius,
      if (connector != null) 'connector': connector,
      if (network != null) 'network': network,
      if (level != null) 'level': level,
      if (fastOnly != null) 'fastOnly': fastOnly,
      if (access != null) 'access': access,
      if (status != null) 'status': status,
      if (limit != null) 'limit': limit,
    };
}

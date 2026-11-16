/// EV Charging Stations API client for Dart/Flutter
///
/// EV Charging Stations finds electric vehicle charging stations within a radius of a point, a ZIP or postal code, or a city, across the US and Canada, sorted by distance. Each station returns its address, coordinates, distance, status, access, network, Level 1, Level 2 and DC fast port counts and connector types. Filter by connector, network, charging level or fast charging only. Paid plans add charging power in kW, pricing, access hours, phone, facility type and open dates.
///
/// For more information, visit: https://apiverve.com/marketplace/evchargingstations?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_evchargingstations;

export 'src/client.dart';
export 'src/models.dart';

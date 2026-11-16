import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class EvchargingstationsValidationException implements Exception {
  final List<String> errors;

  EvchargingstationsValidationException(this.errors);

  @override
  String toString() => 'EvchargingstationsValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// EV Charging Stations API client.
///
/// For more information, visit: https://apiverve.com/marketplace/evchargingstations?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [lat] - Latitude of the search centre. Use lat and lon, a zip, or a city and state [min: -90, max: 90]
/// * [lon] - Longitude of the search centre [min: -180, max: 180]
/// * [zip] - US ZIP code or Canadian postal code to search around [maxLength: 10]
/// * [city] - City to search around, with state [maxLength: 60]
/// * [state] - Two-letter US state or Canadian province code, with city [maxLength: 2]
/// * [radius] - Search radius in kilometres, up to 80 [min: 0.1, max: 80]
/// * [connector] - Only stations with one of these connectors, comma-separated: j1772, ccs, chademo, nacs, nema515, nema520, nema1450, mcs [maxLength: 60]
/// * [network] - Only stations on a network whose name contains this, for example Tesla, ChargePoint or Electrify America [maxLength: 60]
/// * [level] - Only stations with ports at this charging level
/// * [fastOnly] - Only stations with DC fast charging
/// * [access] - Public stations (default), private ones, or all
/// * [status] - Open stations (default), planned, temporarily unavailable, or all
/// * [limit] - Maximum number of stations to return, 1-100 [min: 1, max: 100]
class EvchargingstationsClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'lat': ValidationRule(type: 'number', required: false, min: -90, max: 90),
    'lon': ValidationRule(type: 'number', required: false, min: -180, max: 180),
    'zip': ValidationRule(type: 'string', required: false, maxLength: 10),
    'city': ValidationRule(type: 'string', required: false, maxLength: 60),
    'state': ValidationRule(type: 'string', required: false, maxLength: 2),
    'radius': ValidationRule(type: 'number', required: false, min: 0.1, max: 80),
    'connector': ValidationRule(type: 'string', required: false, maxLength: 60),
    'network': ValidationRule(type: 'string', required: false, maxLength: 60),
    'level': ValidationRule(type: 'string', required: false),
    'fastOnly': ValidationRule(type: 'boolean', required: false),
    'access': ValidationRule(type: 'string', required: false),
    'status': ValidationRule(type: 'string', required: false),
    'limit': ValidationRule(type: 'integer', required: false, min: 1, max: 100),
  };

  EvchargingstationsClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/evchargingstations',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [EvchargingstationsValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw EvchargingstationsValidationException(errors);
    }
  }

  /// Execute a request to the EV Charging Stations API.
  ///
  /// Parameters are validated before sending the request.
  Future<EvchargingstationsResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw EvchargingstationsException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return EvchargingstationsResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw EvchargingstationsException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw EvchargingstationsException('Resource not found');
      } else {
        throw EvchargingstationsException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is EvchargingstationsException) rethrow;
      throw EvchargingstationsException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the EV Charging Stations API client.
class EvchargingstationsException implements Exception {
  final String message;

  EvchargingstationsException(this.message);

  @override
  String toString() => 'EvchargingstationsException: $message';
}

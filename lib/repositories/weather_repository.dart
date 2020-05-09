import 'dart:async';
import 'package:meta/meta.dart';

import 'weather_api_client.dart';
import 'package:weather_app_minimal/models/weather.dart';

class WeatherRepository {
  final WeatherApiClient apiClient;
  WeatherRepository({ @required this.apiClient })
    : assert( apiClient != null );

  Future<Weather> getWeather(String city) async {
    final int locationId = await apiClient.getLocationId( city );
    return apiClient.fetchWeather(locationId);
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:weather_app_minimal/models/weather.dart';

class WeatherApiClient {
  WeatherApiClient({ @required this.httpClient })
    : assert( httpClient != null );

  static const String baseURL = 'https://www.metaweather.com';
  final http.Client httpClient;

  //getLocationId(String city)
  Future<int> getLocationId(String city) async {
    final locationURL = '$baseURL/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationURL);

    if (locationResponse.statusCode != 200)
      throw Exception( 'Error getting location ID from city' );

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  //fetchWeather(int locationId)
  Future<Weather> fetchWeather(int locationId) async {
    final weatherURL = '$baseURL/api/location/$locationId';
    final apiResponse = await this.httpClient.get(weatherURL);

    if ( apiResponse.statusCode != 200 )
      throw Exception('Error getting weather for location');
    
    final weatherJSON = jsonDecode(apiResponse.body);
    return Weather.fromJSON( weatherJSON );
  }
}
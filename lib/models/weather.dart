import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum WeatherCondition {
  SNOW,
  SLEET,
  HAIL,
  THUNDERSTORM,
  HEAVYRAIN,
  LIGHTRAIN,
  SHOWERS,
  HEAVYCLOUD,
  LIGHTCLOUD,
  CLEAR,
  UNKNOWN
}

enum WeatherDataType {
  CONDITION,
  LOCATION,
  LOCATION_ID,
  MIN_TEMP,
  MAX_TEMP,
  TEMP,
  HUMIDITY,
  VISIBILITY,
  AIR_PRESSURE,
  PREDICTABILITY,
  WIND_SPEED,
  WIND_DIRECTION,
  WIND_DIRECTION_COMPASS
}

class WeatherDefiniton {
  final WeatherCondition weatherCondition;
  final String name;
  final IconData icon;
  final String abbr;
  WeatherDefiniton({ this.weatherCondition, this.name, this.icon, this.abbr })
    : assert( weatherCondition != null ),
      assert( name != null ),
      assert( icon != null ),
      assert( abbr != null );
}

List<WeatherDefiniton> weatherDefinitions = <WeatherDefiniton>[
  WeatherDefiniton(
    weatherCondition: WeatherCondition.CLEAR,
    name: 'Clear',
    icon: Icons.ac_unit,
    abbr: 'c',
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.HAIL,
    name: 'Hail',
    icon: Icons.ac_unit,
    abbr: 'h'
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.HEAVYCLOUD,
    name: 'Heavy Clouds',
    icon: Icons.ac_unit,
    abbr: 'hc'
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.HEAVYRAIN,
    name: 'Heavy Rain',
    icon: Icons.ac_unit,
    abbr: 'hr'
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.LIGHTCLOUD,
    name: 'Light Clouds',
    icon: Icons.ac_unit,
    abbr: 'lc'
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.LIGHTRAIN,
    name: 'Light Rain',
    icon: Icons.ac_unit,
    abbr: 'lr',
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.SHOWERS,
    name: 'Showers',
    icon: Icons.ac_unit,
    abbr: 's',
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.SLEET,
    name: 'Sleet',
    icon: Icons.ac_unit,
    abbr: 'sl',
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.SNOW,
    name: 'Snow',
    icon: Icons.ac_unit,
    abbr: 'sn',
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.THUNDERSTORM,
    name: 'Thunderstorm',
    icon: Icons.ac_unit,
    abbr: 't',
  ),
  WeatherDefiniton(
    weatherCondition: WeatherCondition.UNKNOWN,
    name: 'Unkown',
    icon: Icons.ac_unit,
    abbr: 'u'
  ),
];

class Weather extends Equatable {
  final WeatherCondition condition;
  final String formattedCondition, created, location;
  final double minTemp, temp, maxTemp;
  final int locationId;
  final DateTime lastUpdated;
  final IconData icon;
  final String name;

  final double humidity;        // percentage
  final double visibility;      // miles
  final double airPressure;    // mbar
  final double windSpeed;      // mph
  final double windDirection;  // degrees
  final String windDirectionCompass;  // compass point
  final int predictability;     // percentage

  const Weather({this.humidity, this.visibility, this.airPressure, this.windSpeed, this.windDirection, this.windDirectionCompass, this.predictability,this.created, this.location, this.minTemp, this.temp, this.maxTemp, this.locationId, this.lastUpdated, this.condition, this.formattedCondition, this.icon, this.name});

  @override
  List<Object> get props => [
    condition, formattedCondition, minTemp, temp, maxTemp, locationId, created, lastUpdated, location,
    humidity, visibility, airPressure, windSpeed, windDirectionCompass, windDirectionCompass, predictability
  ];

  dynamic getData({ String dataType }) {
    switch( dataType ) {
      case 'condition'      : return condition;
      case 'minTemp'        : return minTemp;
      case 'temp'           : return temp;
      case 'maxTemp'        : return maxTemp;
      case 'humidity'       : return humidity;
      case 'visibility'     : return visibility;
      case 'airPressure'    : return airPressure;
      case 'predictability' : return predictability;
      case 'windSpeed'      : return windSpeed;
      case 'windDirectionCompass' : return windDirectionCompass;
      
    }
    return null;
  }

  dynamic getDataByWeatherDataType({ WeatherDataType weatherDataType }) {
    switch( weatherDataType ) {
      
      case WeatherDataType.CONDITION:
        return condition;
      case WeatherDataType.LOCATION:
        return location;
      case WeatherDataType.LOCATION_ID:
        return locationId;
      case WeatherDataType.MIN_TEMP:
        return minTemp;
      case WeatherDataType.MAX_TEMP:
        return maxTemp;
      case WeatherDataType.TEMP:
        return temp;
      case WeatherDataType.HUMIDITY:
        return humidity;
      case WeatherDataType.VISIBILITY:
        return visibility;
      case WeatherDataType.AIR_PRESSURE:
        return airPressure;
      case WeatherDataType.PREDICTABILITY:
        return predictability;
      case WeatherDataType.WIND_SPEED:
        return windSpeed;
      case WeatherDataType.WIND_DIRECTION:
        return windDirection;
      case WeatherDataType.WIND_DIRECTION_COMPASS:
        return windDirectionCompass;
    }
    return null;
  }

  static WeatherCondition _mapStringToWeatherCondition( String input ) {
    int index = weatherDefinitions.indexWhere( (wd) => (wd.abbr == input) );
    return weatherDefinitions[index].weatherCondition;
  }

  static IconData _mapStringToWeatherIcon( String input ) {
    int index = weatherDefinitions.indexWhere( (wd) => (wd.abbr == input) );
    return weatherDefinitions[index].icon;
  }

  static Weather fromJSON(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      condition             : _mapStringToWeatherCondition(
        consolidatedWeather['weather_state_abbr']
      ),
      formattedCondition    : consolidatedWeather['weather_state_name'],
      minTemp               : consolidatedWeather['min_temp'] as double,
      temp                  : consolidatedWeather['the_temp'] as double,
      maxTemp               : consolidatedWeather['max_temp'] as double,
      locationId            : json['woeid'] as int,
      created               : consolidatedWeather['created'],
      lastUpdated           : DateTime.now(),
      location              : json['title'],

      // Additional data
      name                  : consolidatedWeather['weather_state_name'],
      icon                  : _mapStringToWeatherIcon(
        consolidatedWeather['weather_state_abbr']
      ),

      // Atmospheric data
      humidity              : consolidatedWeather['humidity'],
      visibility            : consolidatedWeather['visibility'],
      airPressure           : consolidatedWeather['air_pressure'],
      windSpeed             : consolidatedWeather['wind_speed'],
      windDirection         : consolidatedWeather['wind_direction'],
      windDirectionCompass  : consolidatedWeather['wind_direction_compass'],
      predictability        : consolidatedWeather['predictability'],
    );
  }

  static Weather fromWeatherCondition({ WeatherCondition weatherCondition }) {
    int index = weatherDefinitions.indexWhere( (wd) => (wd.weatherCondition == weatherCondition) );
    return Weather(
      condition: weatherCondition,
      formattedCondition: null,
      minTemp: null,
      temp: null,
      maxTemp: null,
      locationId: null,
      created: null,
      lastUpdated: null,
      location: null,
      name: weatherDefinitions[index].name,
      icon: weatherDefinitions[index].icon,
    );
  }

}
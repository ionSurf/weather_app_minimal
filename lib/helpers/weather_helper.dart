import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

enum WeatherType {
  SUNNY,
  THUNDERSTORM,
  HAIL,
  SLEET,
  SNOW
}

class Weather {
  Weather( { @required weatherType, @required name, @required icon } )
    : assert( weatherType != null ),
      assert( name != null),
      assert( icon != null ) {
        _weatherType = weatherType;
        _name = name;
        _icon = icon;
  }

  Weather.fromParams({ @required WeatherType weatherType }) 
  : assert(weatherType != null) {
    switch( weatherType ) {
      case WeatherType.SUNNY:
        this._weatherType = weatherType;
        this._name = 'Sunny';
        this._icon = Icons.ac_unit;
        break;
      case WeatherType.THUNDERSTORM:
        this._weatherType = weatherType;
        this._name = 'Thunderstorm';
        this._icon = Icons.ac_unit;
        break;
      case WeatherType.HAIL:
        this._weatherType = weatherType;
        this._name = 'Hail';
        this._icon = Icons.ac_unit;
        break;
      case WeatherType.SLEET:
        this._weatherType = weatherType;
        this._name = 'Sleet';
        this._icon = Icons.ac_unit;
        break;
      case WeatherType.SNOW:
        this._weatherType = weatherType;
        this._name = 'Snow';
        this._icon = Icons.ac_unit;
        break;
    }
  }

  WeatherType _weatherType;
  String _name;
  IconData _icon;

  get weatherType => _weatherType;
  get name => _name;
  get icon => _icon;
}

/*class WeatherMaker {
  static make( WeatherType wt ) {
    switch(wt) {
      case WeatherType.SUNNY:
        return Weather(
          name: 'sunny',
          weatherType: wt,
          icon: Icons.ac_unit
        );
        break;
      case WeatherType.THUNDERSTORM:
        return Weather(
          name: 'sunny',
          weatherType: wt,
          icon: Icons.ac_unit
        );
        break;
      case WeatherType.HAIL:
        return Weather(
          name: 'sunny',
          weatherType: wt,
          icon: Icons.ac_unit
        );
        break;
      case WeatherType.SLEET:
        return Weather(
          name: 'sunny',
          weatherType: wt,
          icon: Icons.ac_unit
        );
        break;
      case WeatherType.SNOW:
        return Weather(
          name: 'sunny',
          weatherType: wt,
          icon: Icons.ac_unit
        );
        break;
    }
  }
}*/
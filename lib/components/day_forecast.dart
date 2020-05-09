import 'package:flutter/material.dart';
import 'package:weather_app_minimal/models/weather.dart';
import 'package:weather_app_minimal/template/styles.dart' as Styles;

class DayForecastGroup extends StatelessWidget {
  const DayForecastGroup({Key key, this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }
}

class DayForecast extends StatelessWidget {
  const DayForecast({Key key, this.weekday, this.temp, this.weather})
      : super(key: key);

  final String weekday; 
  final double temp;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Text(
          weekday,
          style: Styles.dailyForecastDayTD.textStyle,
          textAlign: Styles.dailyForecastDayTD.textAlign,
        ),
        Icon(weather.icon, color: Colors.white, size: 30.0),
        Text(
          temp.toString(),
          style: Styles.dailyForecastAVGTempTD.textStyle,
          textAlign: Styles.dailyForecastAVGTempTD.textAlign,
        ),
      ],
    ));
  }
}

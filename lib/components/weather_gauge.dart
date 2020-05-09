import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_minimal/bloc/weather_bloc.dart';
import 'package:weather_app_minimal/models/weather.dart';
import 'package:weather_app_minimal/template/styles.dart' as Styles;

/* TODO :: Think about different forms of visual representation types for this class */
class WeatherGaugeView extends StatelessWidget {
  const WeatherGaugeView(
      {Key key, this.name, this.data, this.suffix = "%", this.icon})
      : super(key: key);

  final String name;
  final double data;
  final String suffix;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          name,
          style: Styles.weatherGaugeNameTD.textStyle,
          textAlign: Styles.weatherGaugeNameTD.textAlign,
        ),
        Text(
          data.toString() + suffix,
          style: Styles.weatherGaugeReadingTD.textStyle,
          textAlign: Styles.weatherGaugeReadingTD.textAlign,
        ),
        Icon(icon, color: Colors.white, size: 30.0),
      ],
    );
  }
}

class WeatherGaugesGroup extends StatelessWidget {
  const WeatherGaugesGroup({Key key, this.gaugesList}) : super(key: key);

  final List<WeatherGauge> gaugesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: gaugesList,
      ),
    );
  }
}

class WeatherGauge extends StatefulWidget {
  WeatherGauge(
      {Key key,
      this.readingType,
      this.title,
      this.icon,
      this.suffix = "%",
      this.weatherDataType})
      : super(key: key);

  final String title;
  final IconData icon;
  final String suffix;
  final String readingType;
  final WeatherDataType weatherDataType;

  @override
  _WeatherGaugeState createState() => _WeatherGaugeState();
}

class _WeatherGaugeState extends State<WeatherGauge> {
  dynamic reading;

  @override
  void initState() {
    super.initState();
    reading = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherLoaded &&
                  reading !=
                      state.weather.getDataByWeatherDataType(
                          weatherDataType: widget.weatherDataType)) {
                reading = state.weather.getDataByWeatherDataType(
                    weatherDataType: widget.weatherDataType);
              }
            },
            child: WeatherGaugeView(
              name: widget.title,
              icon: widget.icon,
              suffix: widget.suffix,
              data: reading,
            ),
          ),
        ],
      ),
    );
  }
}

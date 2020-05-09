import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_minimal/bloc/weather_bloc.dart';
import 'package:weather_app_minimal/components/weather_gauge.dart';
import 'package:weather_app_minimal/components/weather_background.dart';
import 'package:weather_app_minimal/models/weather.dart';
import 'package:weather_app_minimal/components/day_forecast.dart';

import 'package:weather_app_minimal/template/styles.dart' as Styles;

class WeatherMainGauge extends StatefulWidget {
  WeatherMainGauge({Key key}) : super(key: key);

  @override
  _WeatherMainGaugeState createState() => _WeatherMainGaugeState();
}

class _WeatherMainGaugeState extends State<WeatherMainGauge> {
  double temp;
  //Weather weather;

  @override
  void initState() {
    super.initState();

    //weather = Weather.fromWeatherCondition( weatherCondition: WeatherCondition.CLEAR );
    temp = 0.0;
  }

  renderReadyState({ Weather weather }) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            weather.name,
            style: Styles.mainGaugeForecastTD.textStyle,
            textAlign: Styles.mainGaugeForecastTD.textAlign,
          ),
          Icon(
            weather.icon, 
            color: Colors.white, 
            size: 30.0,
          ),
          Text(temp.toString(),
              style: Styles.mainGaugeTempTD.textStyle,
              textAlign: Styles.mainGaugeTempTD.textAlign),
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return Center(child: Text('Please enter a location'),);
        } else if ( state is WeatherLoading ) {
          return Center(child: CircularProgressIndicator(),);
        } else if ( state is WeatherError ) {
          return Center(child: Text("Something's wrong", style: TextStyle( color: Colors.red )),);
        } else if ( state is WeatherLoaded ) {
          return renderReadyState( weather: state.weather );
        }
        return Center(child: Text('State Unkown'),);
      },
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  WeatherGaugesGroup weatherGaugesGroup = WeatherGaugesGroup(
    gaugesList: <WeatherGauge>[
      WeatherGauge(
        icon: Icons.ac_unit,
        title: 'Humidity',
      ),
      WeatherGauge(
        icon: Icons.ac_unit,
        title: 'Precipitation',
      ),
      WeatherGauge(
        icon: Icons.ac_unit,
        title: 'Wind',
      ),
    ],
  );

  DayForecastGroup dayForecastGroup = DayForecastGroup(children: <DayForecast>[
    DayForecast(
        weather: Weather.fromWeatherCondition( weatherCondition: WeatherCondition.CLEAR ),
        temp: 10.0,
        weekday: 'Mon'),
    DayForecast(
        weather: Weather.fromWeatherCondition( weatherCondition: WeatherCondition.HAIL ),
        temp: 10.0,
        weekday: 'TUE'),
    DayForecast(
        weather: Weather.fromWeatherCondition( weatherCondition: WeatherCondition.HEAVYCLOUD ),
        temp: 10.0,
        weekday: 'WED'),
    DayForecast(
        weather: Weather.fromWeatherCondition( weatherCondition: WeatherCondition.THUNDERSTORM ),
        temp: 10.0,
        weekday: 'THU'),
  ]);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                // Top row
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    WeatherMainGauge(),
                    weatherGaugesGroup,
                  ],
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: dayForecastGroup,
                ),
              )
            ],
          ),
          //WeatherBackground()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_minimal/controllers/controllers.dart';
import 'package:weather_app_minimal/repositories/repositories.dart';

import 'bloc/weather_bloc.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;
  App({ this.weatherRepository })
    : assert(weatherRepository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App Minimal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomeController(),
      home: MultiBlocProvider(
        child: HomeController(),
        providers: [
          BlocProvider(
            create: ( context ) => WeatherBloc( 
              weatherRepository: weatherRepository 
            ),
          ),
        ],
      ),
    );
  }
}
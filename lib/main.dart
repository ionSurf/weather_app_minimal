import 'package:flutter/material.dart';
import 'package:weather_app_minimal/app.dart';

import 'package:bloc/bloc.dart';
import 'package:weather_app_minimal/repositories/repositories.dart';
import 'bloc/simple_bloc_delegate.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final WeatherRepository weatherRepository = WeatherRepository(
    apiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(App( weatherRepository: weatherRepository ));
}
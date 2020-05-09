import 'package:flutter/material.dart';
import 'package:weather_app_minimal/components/home_view.dart';
import 'package:weather_app_minimal/template/forecast_template.dart';

class HomeController extends StatefulWidget {
  HomeController({Key key}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ForecastTemplate(
       child: HomeView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:weather_app_minimal/components/navi_panel.dart';

class ForecastTemplate extends StatelessWidget {
  const ForecastTemplate({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Container(
          child: child,
          decoration: BoxDecoration(
            color: Colors.black,
            ),
        ),
        NaviPanel()
      ],)
    );
  }
} 
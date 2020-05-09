import 'package:flutter/material.dart';

class WeatherBackground extends StatefulWidget {
  WeatherBackground({Key key}) : super(key: key);

  @override
  _WeatherBackgroundState createState() => _WeatherBackgroundState();
}

class _WeatherBackgroundState extends State<WeatherBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Expanded(
         child: Container(
           color: Colors.teal[100],
           ),
         ),
    );
  }
}
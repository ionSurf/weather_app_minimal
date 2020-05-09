import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_minimal/bloc/weather_bloc.dart';
import 'package:weather_app_minimal/components/city_selection.dart';

class NaviPanel extends StatelessWidget {
  const NaviPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              final city = await Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                )
              );
              if ( city != null ) {
                BlocProvider.of<WeatherBloc>(context).add(
                  FetchWeather(city: city),
                );
              }
            }, 
            icon: Icon(Icons.search), 
            label: Text('Search')
          ),
        ],
      ),
    );
  }
}
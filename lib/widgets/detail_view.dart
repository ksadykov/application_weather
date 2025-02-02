import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_map/models/weather_forecast_daily.dart';
import 'package:weather_map/utilites/forecast_util.dart';

class DatailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast?> snapshot;
  const DatailView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var pressure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getItem(FontAwesomeIcons.thermometer, pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity!, '%'),
          Util.getItem(FontAwesomeIcons.wind, wind!.toInt(), 'm/s'),
        ],
      ),
    );
  }
}

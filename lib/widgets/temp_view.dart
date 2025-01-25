import 'package:flutter/material.dart';
import 'package:weather_map/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast?> snapshot;
  const TempView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var icon = forecastList![0].getIconUrl();
    var temp = forecastList[0].temp!.day;
    var dectionery = forecastList[0].weather![0].description!.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            fit: BoxFit.cover,
            width: 100,
            height: 100,
            icon,
          ),
          Column(
            children: [
              Text(
                '$temp C',
                style: TextStyle(color: Colors.black, fontSize: 54.0),
              ),
              Text(
                '$dectionery',
                style: TextStyle(color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}

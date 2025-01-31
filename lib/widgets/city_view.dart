import 'package:flutter/material.dart';
import 'package:weather_map/models/weather_forecast_daily.dart';
import 'package:weather_map/utilites/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast?> snapshot;
  const CityView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);

    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            '${Util.getFromattedDate(formattedDate)}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

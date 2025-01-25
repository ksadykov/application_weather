import 'package:flutter/material.dart';
import 'package:weather_map/screen/weather_forecast_sreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: const WeatherForecastScreenState(),
    );
  }
}

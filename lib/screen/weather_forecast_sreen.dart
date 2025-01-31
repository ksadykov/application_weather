import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_map/api/weather_api.dart';
import 'package:weather_map/models/weather_forecast_daily.dart';
import 'package:weather_map/screen/city_screen.dart';
import 'package:weather_map/widgets/bottom_list_view.dart';
import 'package:weather_map/widgets/city_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_map/widgets/detail_view.dart';
import 'package:weather_map/widgets/temp_view.dart';

class WeatherForecastScreenState extends StatefulWidget {
  const WeatherForecastScreenState({super.key});

  @override
  State<WeatherForecastScreenState> createState() =>
      _WeatherForecastScreenStateState();
}

class _WeatherForecastScreenStateState
    extends State<WeatherForecastScreenState> {
  late Future<WeatherForecast?> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print(weather?.list?[0].weather?[0].main);
    //   log('log: --  ${weather?.list?[0].weather?[0].main}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Weather', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                var tappName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CityScreen()));
                if (tappName != Null) {
                  _cityName = tappName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecastWithCity(cityName: _cityName);
                }
              },
              icon: Icon(
                Icons.location_city,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast?>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData || snapshot.data == Null) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50.0,
                        ),
                        //Text(snapshot.data.messag),
                        CityView(snapshot: snapshot),
                        SizedBox(
                          height: 50.0,
                        ),
                        TempView(snapshot: snapshot),
                        SizedBox(height: 50.0),
                        DatailView(
                          snapshot: snapshot,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        BottomListView(snapshot: snapshot)
                      ],
                    );
                  } else {
                    return Center(
                      child: SpinKitFadingCircle(
                        duration: Duration(minutes: 10),
                        color: Colors.green,
                        size: 100,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

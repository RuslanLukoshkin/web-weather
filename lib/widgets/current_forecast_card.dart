import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/current_day_model.dart';

class CurrentForecast extends StatelessWidget {
  const CurrentForecast({
    super.key,
    required CurrentDayModel weather,
    required this.currentDate,
  }) : _weather = weather;

  final CurrentDayModel _weather;
  final String currentDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Text(
          _weather.cityName,
        ),
        Text("$currentDate "),
        Text(
          "Temperature: ${_weather.temperature.round()}°C",
        ),
        Text(
          "Feels like: ${_weather.feelsLike.round()}°C",
        ),
        Text(
          "Wind speed: ${_weather.windSpeed.round()}°C",
        ),
      ]),
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/next_day_model.dart';
import 'package:intl/intl.dart';

class NextDayForecastCard extends StatelessWidget {
  const NextDayForecastCard({
    super.key,
    required NextDayModel forecast,
  }) : _forecast = forecast;

  final NextDayModel _forecast;

  String getForecastDate(NextDayModel forecastWeather) {
    DateFormat parseFormatter = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime parsedDate = parseFormatter.parse(forecastWeather.forecastDate);

    DateFormat formatter = DateFormat("dd MMMM HH:mm");

    return formatter.format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            getForecastDate(_forecast),
          ),
          Text(
            "${_forecast.temperature.round()}°C feels ${_forecast.feelsLike.round()}°C",
          ),
          Text(
            "Max: ${_forecast.tempMax.round()}°C",
          ),
          Text(
            "Min: ${_forecast.tempMin.round()}°C",
          ),
          Text(
            "Wind Speed: ${_forecast.windSpeed.round()}°C",
          ),
        ],
      ),
    );
  }
}

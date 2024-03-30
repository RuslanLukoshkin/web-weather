import 'dart:convert';

import 'package:flutter_weather_app/models/current_day_model.dart';
import 'package:flutter_weather_app/models/next_day_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app/config.dart';

class WeatherService {
  Future<CurrentDayModel> getCurrentWeather(String cityName) async {
    final response = await http.get(Uri.parse(
        '${forecastURL}weather?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return CurrentDayModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Ошибка получения прогноза");
    }
  }

  Future<List<NextDayModel>> getNextDaysForecast(String cityName) async {
    final response = await http.get(Uri.parse(
        '${forecastURL}forecast?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      var forecastList = (jsonDecode(response.body)['list'] as List)
          .map((value) => NextDayModel.fromJson(value))
          .toList();
      return forecastList;
    } else {
      throw Exception("Ошибка получения прогноза");
    }
  }

  Future<String> getGeocondigCityName() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final response = await http.get(Uri.parse(
        '$reverseGeoURL?lat=${position.latitude}&lon=${position.longitude}&limit=1&appid=$apiKey'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body[0]['name'];
    } else {
      throw Exception("Город не был найден");
    }
  }
}

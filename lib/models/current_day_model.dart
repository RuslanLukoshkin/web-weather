class CurrentDayModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final double tempMax;
  final double tempMin;
  final String mainCondition;
  final String icon;
  final double windSpeed;

  CurrentDayModel(
      {required this.cityName,
      required this.temperature,
      required this.feelsLike,
      required this.tempMax,
      required this.tempMin,
      required this.mainCondition,
      required this.icon,
      required this.windSpeed});

  factory CurrentDayModel.fromJson(Map<String, dynamic> json) {
    return CurrentDayModel(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        feelsLike: json['main']['feels_like'].toDouble(),
        tempMax: json['main']['temp_max'].toDouble(),
        tempMin: json['main']['temp_min'].toDouble(),
        mainCondition: json['weather'][0]['main'],
        icon: json['weather'][0]['icon'],
        windSpeed: json['wind']['speed'].toDouble());
  }
}

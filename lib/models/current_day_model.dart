class CurrentDayModel {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final String mainCondition;
  final String icon;
  final double windSpeed;

  CurrentDayModel(
      {required this.cityName,
      required this.temperature,
      required this.feelsLike,
      required this.mainCondition,
      required this.icon,
      required this.windSpeed});

  factory CurrentDayModel.fromJson(Map<String, dynamic> json) {
    return CurrentDayModel(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        feelsLike: json['main']['feels_like'].toDouble(),
        mainCondition: json['weather'][0]['main'],
        icon: json['weather'][0]['icon'],
        windSpeed: json['wind']['speed'].toDouble());
  }
}

class NextDayModel {
  final double temperature;
  final double feelsLike;
  final double tempMax;
  final double tempMin;
  final String mainCondition;
  final String icon;
  final double windSpeed;
  final String forecastDate;

  NextDayModel({
    required this.temperature,
    required this.feelsLike,
    required this.tempMax,
    required this.tempMin,
    required this.mainCondition,
    required this.icon,
    required this.windSpeed,
    required this.forecastDate,
  });

  factory NextDayModel.fromJson(Map<String, dynamic> json) {
    return NextDayModel(
        temperature: json['main']['temp'].toDouble(),
        feelsLike: json['main']['feels_like'].toDouble(),
        tempMax: json['main']['temp_max'].toDouble(),
        tempMin: json['main']['temp_min'].toDouble(),
        mainCondition: json['weather'][0]['main'],
        icon: json['weather'][0]['icon'],
        windSpeed: json['wind']['speed'].toDouble(),
        forecastDate: json['dt_txt']);
  }
}

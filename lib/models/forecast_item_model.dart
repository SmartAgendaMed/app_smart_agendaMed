class ForecastItem {
  final DateTime dateTime;      // Data e hora desta previsão
  final double temperature;
  final String description;
  final String iconCode;

  ForecastItem({
    required this.dateTime,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      // O campo 'dt_txt' vem como String, então precisamos convertê-lo para DateTime
      dateTime: DateTime.parse(json['dt_txt']),
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
    );
  }
}

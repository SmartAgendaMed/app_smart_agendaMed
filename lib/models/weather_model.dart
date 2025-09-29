/// Representa os dados do clima de forma estruturada.
class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition; // Ex: "Clouds", "Rain", "Clear"
  final String description;   // Ex: "nuvens dispersas"
  final String iconCode;      // Código para buscar o ícone visual

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
    required this.iconCode,
  });

  /// Factory constructor: Cria uma instância de Weather a partir de um Map (JSON).
  /// Este é o "parser" que transforma os dados brutos em um objeto organizado.
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      // Acessa o campo 'name' no nível principal do JSON
      cityName: json['name'],

      // Acessa o campo 'temp' que está dentro do objeto 'main'
      temperature: (json['main']['temp'] as num).toDouble(),

      // Acessa o primeiro item da lista 'weather' e pega o campo 'main'
      mainCondition: json['weather'][0]['main'],

      // Acessa o primeiro item da lista 'weather' e pega o campo 'description'
      description: json['weather'][0]['description'],

      // Acessa o primeiro item da lista 'weather' e pega o campo 'icon'
      iconCode: json['weather'][0]['icon'],
    );
  }
}
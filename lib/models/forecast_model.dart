import 'package:hack10/models/forecast_item_model.dart';

/// Representa a resposta completa da API de previsão, contendo uma lista de previsões.
class Forecast {final List<ForecastItem> items;

Forecast({required this.items});

factory Forecast.fromJson(Map<String, dynamic> json) {
  // O JSON tem uma chave 'list' que contém a lista de previsões
  final List<dynamic> forecastListJson = json['list'];

  // Usamos o método 'map' para transformar cada item JSON da lista
  // em um objeto ForecastItem usando o construtor .fromJson que criamos antes.
  final List<ForecastItem> forecastItems = forecastListJson
      .map((itemJson) => ForecastItem.fromJson(itemJson))
      .toList();

  return Forecast(items: forecastItems);
}
}

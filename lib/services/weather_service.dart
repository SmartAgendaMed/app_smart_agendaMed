import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:hack10/models/weather_model.dart';
import 'package:hack10/models/forecast_model.dart'; // <-- Nova importação

/// Serviço para se comunicar com a API do OpenWeatherMap.
class WeatherService {
  // Endpoint para o CLIMA ATUAL
  static const _weatherBaseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Endpoint para a PREVISÃO FUTURA (5 dias / 3 horas)
  static const _forecastBaseUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  final String apiKey;

  WeatherService(this.apiKey);

  /// Busca o CLIMA ATUAL para uma cidade específica.
  /// Retorna um objeto [Weather].
  Future<Weather> getWeather(String cityName) async {
    final uri = Uri.parse('$_weatherBaseUrl?q=$cityName&appid=$apiKey&units=metric&lang=pt_br');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar dados do clima atual. Código: ${response.statusCode}');
    }
  }

  // ===================================================================
  //                       NOVO MÉTODO ADICIONADO
  // ===================================================================

  /// Busca a PREVISÃO DO TEMPO para os próximos 5 dias para uma cidade.
  /// Retorna um objeto [Forecast] contendo uma lista de previsões.
  Future<Forecast> getForecast(String cityName) async {
    final uri = Uri.parse('$_forecastBaseUrl?q=$cityName&appid=$apiKey&units=metric&lang=pt_br');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // Usa o nosso novo Forecast.fromJson para parsear a resposta complexa.
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar dados da previsão. Código: ${response.statusCode}');
    }
  }
}
    
import 'dart:convert';
import 'package:http/http.dart' as http;

// 1. Importação do modelo que criamos. Agora o serviço "conhece" o objeto Weather.
import 'package:hack10/models/weather_model.dart';

/// Serviço para se comunicar com a API do OpenWeatherMap.
class WeatherService {
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  // 2. O método agora promete retornar um objeto 'Weather' já organizado.
  Future<Weather> getWeather(String cityName) async {
    final uri = Uri.parse('$_baseUrl?q=$cityName&appid=$apiKey&units=metric&lang=pt_br');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // 3. Aqui está a mágica: pegamos o JSON, decodificamos e usamos
      // o construtor Weather.fromJson para criar e retornar o objeto pronto.
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar dados do clima. Código: ${response.statusCode}');
    }
  }
}
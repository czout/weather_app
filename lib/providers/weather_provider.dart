// lib/providers/weather_provider.dart
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  final WeatherService _weatherService =
      WeatherService('89adcfce8a26eb868e3f9e25a9ee06a9');

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(String location) async {
    _isLoading = true;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeather(location);
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

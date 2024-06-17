// lib/widgets/weather_display.dart
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.location,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          weather.description,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '${weather.temperature}°C',
          style: TextStyle(fontSize: 32),
        ),
        Text(
          'Humidity: ${weather.humidity}%',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Wind Speed: ${weather.windSpeed} m/s',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

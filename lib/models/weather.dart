class Weather {
  final String location;
  final String description;
  final double temperature;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.location,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    print('Weather JSON: $json'); // Debugging line

    return Weather(
      location: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'Weather(location: $location, description: $description, temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed';
  }
}

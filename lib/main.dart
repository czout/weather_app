import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/weather_display.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weer App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Voer een locatie in',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      final provider =
                          Provider.of<WeatherProvider>(context, listen: false);
                      provider.fetchWeather(_controller.text);
                    },
                  ),
                ),
                onSubmitted: (value) {
                  final provider =
                      Provider.of<WeatherProvider>(context, listen: false);
                  provider.fetchWeather(value);
                },
              ),
              SizedBox(height: 20),
              Consumer<WeatherProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return CircularProgressIndicator();
                  } else if (provider.weather != null) {
                    return WeatherDisplay(weather: provider.weather!);
                  } else if (!provider.isLoading && provider.weather == null) {
                    return Text(
                        'Geen data beschikbaar of geen locatie gevonden.');
                  } else {
                    return Container(); // In case nothing to display
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

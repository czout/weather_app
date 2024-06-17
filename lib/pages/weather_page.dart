import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/pages/login_page.dart';
import 'package:weather_app/widgets/weather_display.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Weer App'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Voeg hier de uitlog logica toe
              Supabase.instance.client.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Voer een locatie in',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        final provider = Provider.of<WeatherProvider>(context,
                            listen: false);
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
                    } else if (!provider.isLoading &&
                        provider.weather == null) {
                      return const Text(
                          'Geen data beschikbaar of geen locatie gevonden.');
                    } else {
                      return Container(); // In case nothing to display
                    }
                  },
                ),
              ],
            ),
            const Text('Credits: Cornelis Zoutewelle - 9018186'),
          ],
        ),
      ),
    );
  }
}

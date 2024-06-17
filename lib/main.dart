import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/secrets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: sbUrl,
    anonKey: sbAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 240, 169, 17),
              ),
            ),
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 240, 169, 17),
            ),
            suffixIconColor: Color.fromARGB(255, 240, 169, 17),
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}

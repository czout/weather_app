import 'package:flutter/material.dart';
import 'package:weather_app/widgets/form_display.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Column(children: [
          // Weather App Logo
          const SizedBox(height: 25),
          Image.asset(
            'lib/images/WeatherApp_Logo.png',
            height: 200,
            width: 200,
          ),

          // Welcome Message
          const SizedBox(height: 5),

          Text(
            'Welcome back, please sign in.',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),

          // Email TextField
          const SizedBox(height: 25),

          FormDisplay(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          // Password TextField
          const SizedBox(height: 25),

          FormDisplay(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          // Sign-In Button
          const SizedBox(height: 25),

          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 169, 17),
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                  child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
            ),
          )
        ]))));
  }
}

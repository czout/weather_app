import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:weather_app/pages/singup_page.dart';
import 'package:weather_app/widgets/form_display.dart';
import 'package:weather_app/pages/weather_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign-In Logic
  Future<void> userSignIn(BuildContext context) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    if (response.session != null) {
      // Navigate to your home screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WeatherPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
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
            onTap: () => userSignIn(context),
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
          ),

          // Registration Button
          const SizedBox(height: 25),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: const Text('Don\'t have an account? Register here'),
          )
        ])))));
  }
}

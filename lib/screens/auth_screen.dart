import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Login / Register'),
            const SizedBox(height: 4),
            Image.asset('assets/logo/nomadiq_logo.jpg', height: 20),
          ],
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Login or register to continue',
          style: TextStyle(fontSize: 18),
        ),
      ).animate().fadeIn(duration: 400.ms),
    );
  }
}
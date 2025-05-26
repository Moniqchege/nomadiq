import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TourPlanScreen extends StatelessWidget {
  const TourPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Your Tour Plans'),
            const SizedBox(height: 4),
            Image.asset('assets/logo/nomadiq_logo.jpg', height: 20),
          ],
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'View and manage your tour plans',
          style: TextStyle(fontSize: 18),
        ),
      ).animate().fadeIn(duration: 400.ms),
    );
  }
}
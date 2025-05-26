import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Book Your Tour'),
            const SizedBox(height: 4),
            Image.asset('assets/logo/nomadiq_logo.jpg', height: 20),
          ],
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Booking functionality to be implemented',
          style: TextStyle(fontSize: 18),
        ),
      ).animate().fadeIn(duration: 400.ms),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/tour_plan_screen.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(const NomadiQApp());
}

class NomadiQApp extends StatelessWidget {
  const NomadiQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NomadiQ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}
// ignore: library_private_types_in_public_api
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const BookingScreen(),
    const TourPlanScreen(),
    const AuthScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex]
          .animate()
          .fadeIn(duration: 300.ms)
          .slideY(begin: 0.2, end: 0.0, duration: 300.ms),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Tour Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
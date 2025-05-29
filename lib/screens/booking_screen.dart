import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/destinations_data.dart';
import '../data/budget_data.dart';

class BookingScreen extends StatefulWidget {
  final Destination destination;

  const BookingScreen({super.key, required this.destination});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int? selectedBudgetIndex;
  List<Map<String, dynamic>> hotels = [];
  List<Map<String, dynamic>> dining = [];
  List<Map<String, dynamic>> entertainment = [];
  bool isLoading = false;
  String? errorMessage;

  // Google Maps Places API key (assumed to be configured in your app)
  static const String apiKey = 'AIzaSyAlEgvT0oF_LV89f2ZtLHlcLyMNNmCke5g'; // Replace with your actual key if not configured globally

  @override
  void initState() {
    super.initState();
    // Optionally pre-fetch data if needed, but we'll trigger on budget selection
  }

  Future<void> _fetchNearbyPlaces(String type, List<Map<String, dynamic>> targetList) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${widget.destination.latitude},${widget.destination.longitude}&radius=5000&type=$type&key=$apiKey');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          setState(() {
            targetList.clear();
            targetList.addAll(List<Map<String, dynamic>>.from(data['results'].map((result) => {
              'name': result['name'],
              'rating': result['rating']?.toDouble() ?? 0.0,
              'vicinity': result['vicinity'] ?? '',
            })));
          });
        } else {
          setState(() {
            errorMessage = data['error_message'] ?? 'Failed to load $type places';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Failed to load $type places: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching $type places: $e';
      });
    }
  }

  Future<void> _loadPlacesData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    await Future.wait([
      _fetchNearbyPlaces('lodging', hotels),
      _fetchNearbyPlaces('restaurant', dining),
      _fetchNearbyPlaces('tourist_attraction', entertainment),
    ]);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.destination.title}'),
      ),
      body: selectedBudgetIndex == null
          ? _buildBudgetSelection()
          : _buildBookingDetails(),
    );
  }

  Widget _buildBudgetSelection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Your Budget',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...budgetOptions.asMap().entries.map((entry) {
            final index = entry.key;
            final budget = entry.value;
            return Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  color: budget.color,
                  child: ListTile(
                    title: Text(
                      '${budget.title} - ${budget.price} (${budget.days} Days)',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onTap: () {
                      setState(() {
                        selectedBudgetIndex = index;
                        _loadPlacesData();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildBookingDetails() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Booking Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Hotels',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (hotels.isEmpty) const Text('No hotels found nearby.'),
          ...hotels.map<Widget>((hotel) => ListTile(
            title: Text(hotel['name']),
            subtitle: Text(hotel['vicinity']),
            trailing: Text('${hotel['rating']} ★'),
          )),
          const SizedBox(height: 16),
          const Text(
            'Dining',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (dining.isEmpty) const Text('No restaurants found nearby.'),
          ...dining.map<Widget>((dining) => ListTile(
            title: Text(dining['name']),
            subtitle: Text(dining['vicinity']),
            trailing: Text('${dining['rating']} ★'),
          )),
          const SizedBox(height: 16),
          Text(
            'Entertainment Activities: ${entertainment.length}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (entertainment.isEmpty)
            const Text('No entertainment options found nearby.'),
          ...entertainment.map<Widget>((ent) => ListTile(
            title: Text(ent['name']),
            subtitle: Text(ent['vicinity']),
            trailing: Text('${ent['rating']} ★'),
          )),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => setState(() => selectedBudgetIndex = null),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Change Budget',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/destination.dart';
import '../services/api_service.dart';
import 'destination_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}
// ignore: library_private_types_in_public_api
class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Destination> _destinations = [];
  List<Destination> _filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    _loadDestinations();
    _searchController.addListener(() {
      _filterDestinations(_searchController.text);
    });
  }

  Future<void> _loadDestinations() async {
    final destinations = await _apiService.fetchDestinations();
    setState(() {
      _destinations = destinations;
      _filteredDestinations = destinations;
    });
  }

  void _filterDestinations(String query) {
    setState(() {
      _filteredDestinations = _destinations
          .where((destination) =>
          destination.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('NomadiQ'),
            const SizedBox(height: 4),
            Image.asset(
                'assets/images/logo.png',
                height: 20,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red, size: 20);
              },
            ), // Replace with your logo asset
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Destinations',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _destinations.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _filteredDestinations.isEmpty && _searchController.text.isNotEmpty
                ? const Center(child: Text('No results found'))
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = _filteredDestinations[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DestinationDetailScreen(destination: destination),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            destination.imageUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                'https://via.placeholder.com/180',
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                destination.description,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${destination.rating.toStringAsFixed(1)}/5',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate()
                    .fadeIn(duration: 500.ms, delay: (index * 100).ms)
                    .slideX(
                  begin: 0.2,
                  end: 0.0,
                  duration: 500.ms,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
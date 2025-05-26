import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/destination.dart';

class ApiService {
  static const String _geoapifyBaseUrl = 'https://api.geoapify.com/v1/places';
  static const String _geoapifyApiKey = '316b2d0cc665440fa55fa5f749b6b6e8';

  Future<List<Destination>> fetchDestinations() async {
    final url = Uri.parse(
        '$_geoapifyBaseUrl?categories=tourism.sights&filter=countrycode:ke&limit=50&apiKey=$_geoapifyApiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final features = data['features'] as List<dynamic>? ?? [];
      return features.map((feature) {
        final properties = feature['properties'] as Map<String, dynamic>? ?? {};
        final name = properties['name'] ?? 'Unknown Destination';
        final datasource = properties['datasource'] as Map<String, dynamic>? ?? {};
        final raw = datasource['raw'] as Map<String, dynamic>? ?? {};
        final images = raw['images'] as List<dynamic>? ?? [];
        final imageUrl = images.isNotEmpty ? images[0] as String : 'https://via.placeholder.com/180';
        final rating = _getRating(name);
        return Destination(
          id: name.toLowerCase().replaceAll(' ', '_'),
          name: name,
          imageUrl: imageUrl,
          rating: rating,
          description: _getDescription(name),
          location: properties['city'] ?? properties['county'] ?? 'Kenya',
          tourPlans: _getTourPlans(name),
        );
      }).toList();
    } else {
      throw Exception('Failed to load destinations: ${response.statusCode}');
    }
  }

  double _getRating(String name) {
    const ratings = {
      'Masai Mara National Reserve': 4.8,
      'Amboseli National Park': 4.6,
      'Diani Beach': 4.7,
      'Nairobi National Park': 4.5,
      'Lake Nakuru National Park': 4.4,
      'Tsavo East National Park': 4.3,
      'Tsavo West National Park': 4.3,
      'Samburu National Reserve': 4.5,
      'Lake Naivasha': 4.2,
      'Lake Turkana': 4.1,
      'Mount Kenya National Park': 4.6,
      'Aberdare National Park': 4.4,
      'Chyulu Hills': 4.2,
      'Shimba Hills National Reserve': 4.3,
      'Lamu Archipelago': 4.7,
      'Wasini Island': 4.3,
      'Watamu': 4.6,
      'Hell’s Gate National Park': 4.4,
      'Ol Pejeta Conservancy': 4.5,
      'Mount Elgon National Park': 4.2,
      'Sibiloi National Park': 4.0,
      'Marafa Depression': 4.1,
      'Kakamega Forest National Reserve': 4.3,
      'Karura Forest': 4.2,
      'Jeevanjee Gardens': 4.0,
      'Gedi Ruins': 4.4,
      'Nyali Beach': 4.5,
      'Bamburi Beach': 4.4,
      'Tiwi Beach': 4.3,
      'Shelly Beach': 4.2,
    };
    return ratings[name] ?? 4.0;
  }

  String _getDescription(String name) {
    const descriptions = {
      'Masai Mara National Reserve': 'Famous for the Great Migration and Big Five wildlife.',
      'Amboseli National Park': 'Iconic views of Mount Kilimanjaro and elephant herds.',
      'Diani Beach': 'Africa’s leading beach destination with white sandy beaches.',
      'Nairobi National Park': 'A wildlife haven just outside the capital city.',
      'Lake Nakuru National Park': 'Famous for flamingos, rhinos, and the Big Five.',
      'Tsavo East National Park': 'Vast park with rugged beauty and high elephant density.',
      'Tsavo West National Park': 'Diverse landscapes with wildlife and scenic views.',
      'Samburu National Reserve': 'Serene park with rare dry-country wildlife.',
      'Lake Naivasha': 'Freshwater lake for birdwatching and hippo sightings.',
      'Lake Turkana': 'The world’s largest desert lake, known as the Jade Sea.',
      'Mount Kenya National Park': 'Features Africa’s second-highest mountain.',
      'Aberdare National Park': 'Lush mountainous area with rare animals.',
      'Chyulu Hills': 'Young volcanic range with Leviathan Cave.',
      'Shimba Hills National Reserve': 'Coastal park with elephants and lush greenery.',
      'Lamu Archipelago': 'Historic islands with beaches and Swahili culture.',
      'Wasini Island': 'Small island with coral reefs and dolphin watching.',
      'Watamu': 'Coastal town with beautiful beaches and coral gardens.',
      'Hell’s Gate National Park': 'Known for rock formations and cycling.',
      'Ol Pejeta Conservancy': 'Big Five reserve with conservation efforts.',
      'Mount Elgon National Park': 'Famous for hiking and Kitum Cave.',
      'Sibiloi National Park': 'UNESCO site with archaeological significance.',
      'Marafa Depression': 'Stunning sandstone gorge near Malindi.',
      'Kakamega Forest National Reserve': 'Kenya’s only tropical rainforest.',
      'Karura Forest': 'Urban forest in Nairobi with trails and waterfalls.',
      'Jeevanjee Gardens': 'Green oasis in Nairobi for relaxation.',
      'Gedi Ruins': 'Historical site with ancient Swahili architecture.',
      'Nyali Beach': 'Popular north shore beach in Mombasa.',
      'Bamburi Beach': 'Sandy beach on Mombasa’s north shore.',
      'Tiwi Beach': 'Quieter beach south of Mombasa.',
      'Shelly Beach': 'Serene beach south of Mombasa.',
    };
    return descriptions[name] ?? 'A beautiful destination in Kenya.';
  }

  Map<String, TourPlan> _getTourPlans(String name) {
    return {
      'Luxury': TourPlan(
        budget: 600000,
        duration: 6,
        accommodations: ['Luxury Safari Lodge', 'Private Camp'],
        dining: ['Fine Dining Restaurant', 'Bush Dinner'],
        entertainment: ['Hot Air Balloon Safari', 'Private Game Drive'],
      ),
      'Mid-range': TourPlan(
        budget: 400000,
        duration: 4,
        accommodations: ['Mid-range Lodge', 'Tented Camp'],
        dining: ['Lodge Restaurant', 'Local Cuisine Night'],
        entertainment: ['Game Drive', 'Cultural Village Visit'],
      ),
      'Budget': TourPlan(
        budget: 100000,
        duration: 2,
        accommodations: ['Budget Camp', 'Basic Lodge'],
        dining: ['Camp Canteen', 'Local Eatery'],
        entertainment: ['Short Safari', 'Nature Walk'],
      ),
    };
  }
}
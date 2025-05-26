class Destination {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String description;
  final String location;
  final Map<String, TourPlan> tourPlans;

  Destination({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.description,
    required this.location,
    required this.tourPlans,
  });
}

class TourPlan {
  final double budget;
  final int duration;
  final List<String> accommodations;
  final List<String> dining;
  final List<String> entertainment;

  TourPlan({
    required this.budget,
    required this.duration,
    required this.accommodations,
    required this.dining,
    required this.entertainment,
  });
}
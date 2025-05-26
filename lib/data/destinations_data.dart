class Destination {
  final String id;
  final List<String> imageUrls;
  final String title;
  final String description;
  final double rating;
  final double latitude;
  final double longitude;

  Destination({
    required this.id,
    required this.imageUrls,
    required this.title,
    required this.description,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });
}

final List<Destination> destinations = [
  // Isiolo
  Destination(
    id: 'samburu_national_reserve',
    imageUrls: List.generate(
      7,
          (index) => 'assets/isiolo/samburu_national_reserve/samburu${index + 1}.jpg',
    ),
    title: 'Samburu National Reserve',
    description: 'Features rare dry-country wildlife and cultural experiences.',
    rating: 4.5,
    latitude: 0.5333,
    longitude: 37.5167,
  ),
  // Kajiado
  Destination(
    id: 'amboseli_national_park',
    imageUrls: List.generate(
      8,
          (index) => 'assets/kajiado/amboseli_national_park/amboseli${index + 1}.jpg',
    ),
    title: 'Amboseli National Park',
    description: 'Iconic for Kilimanjaro views and large elephant herds.',
    rating: 4.6,
    latitude: -2.6437,
    longitude: 37.2463,
  ),
  // Kakamega
  Destination(
    id: 'kakamega_forest_national_reserve',
    imageUrls: List.generate(
      6,
          (index) => 'assets/kakamega/kakamega_forest_national_reserve/kakamega${index + 1}.jpg',
    ),
    title: 'Kakamega Forest National Reserve',
    description: 'Kenya’s only tropical rainforest with monkeys and birds.',
    rating: 4.3,
    latitude: 0.3356,
    longitude: 34.8750,
  ),
  // Kisumu
  Destination(
    id: 'lake_victoria',
    imageUrls: List.generate(
      7,
          (index) => 'assets/kisumu/lake_victoria/victoria${index + 1}.jpg',
    ),
    title: 'Lake Victoria',
    description: 'Africa’s largest lake, offering boat rides and cultural experiences.',
    rating: 4.2,
    latitude: -0.1000,
    longitude: 34.7500,
  ),
  // Kwale
  Destination(
    id: 'chyulu_hills',
    imageUrls: List.generate(
      5,
          (index) => 'assets/kwale/chyulu_hills/chyulu${index + 1}.jpg',
    ),
    title: 'Chyulu Hills',
    description: 'A volcanic range with unique landscapes and Maasai culture.',
    rating: 4.2,
    latitude: -2.7833,
    longitude: 37.8667,
  ),
  // Lamu
  Destination(
    id: 'lamu_archipelago',
    imageUrls: List.generate(
      6,
          (index) => 'assets/lamu/lamu_archipelago/lamu${index + 1}.jpg',
    ),
    title: 'Lamu Archipelago',
    description: 'Historic islands with Swahili culture, beaches, and dhow sailing.',
    rating: 4.7,
    latitude: -2.2700,
    longitude: 40.9000,
  ),
  Destination(
    id: 'wasini_island',
    imageUrls: List.generate(
      6,
          (index) => 'assets/lamu/wasini_island/wasini${index + 1}.jpg',
    ),
    title: 'Wasini Island',
    description: 'A quiet island with world-class snorkeling and coral reefs.',
    rating: 4.3,
    latitude: -4.6667,
    longitude: 39.3667,
  ),
  // Malindi
  Destination(
    id: 'gedi_ruins',
    imageUrls: List.generate(
      6,
          (index) => 'assets/malindi/gedi_ruins/gedi${index + 1}.jpg',
    ),
    title: 'Gedi Ruins',
    description: 'Ancient Swahili ruins surrounded by forest, offering a glimpse into history.',
    rating: 4.3,
    latitude: -3.3167,
    longitude: 39.9833,
  ),
  Destination(
    id: 'marafa_depression',
    imageUrls: List.generate(
      6,
          (index) => 'assets/malindi/marafa_depression/murafa${index + 1}.jpg',
    ),
    title: 'Marafa Depression',
    description: 'A colorful sandstone gorge near Malindi, known as Hell’s Kitchen.',
    rating: 4.1,
    latitude: -3.2000,
    longitude: 39.9167,
  ),
  Destination(
    id: 'watamu',
    imageUrls: List.generate(
      7,
          (index) => 'assets/malindi/watamu/watamu${index + 1}.jpg',
    ),
    title: 'Watamu',
    description: 'A coastal village with white sands, coral outcrops, and marine park snorkeling.',
    rating: 4.6,
    latitude: -3.3500,
    longitude: 40.0167,
  ),
  // Marsabit
  Destination(
    id: 'lake_turkana',
    imageUrls: List.generate(
      7,
          (index) => 'assets/marsabit/lake_turkana/turkana${index + 1}.jpg',
    ),
    title: 'Lake Turkana',
    description: 'The world’s largest desert lake, known as the Jade Sea.',
    rating: 4.1,
    latitude: 3.4167,
    longitude: 36.0167,
  ),
  Destination(
    id: 'sibiloi_national_park',
    imageUrls: List.generate(
      6,
          (index) => 'assets/marsabit/sibiloi_national_park/sibiloi${index + 1}.jpg',
    ),
    title: 'Sibiloi National Park',
    description: 'A UNESCO site with archaeological significance.',
    rating: 4.0,
    latitude: 4.0500,
    longitude: 36.3000,
  ),
  // Mombasa
  Destination(
    id: 'bamburi_beach',
    imageUrls: List.generate(
      6,
          (index) => 'assets/mombasa/bamburi_beach/bamburi${index + 1}.jpg',
    ),
    title: 'Bamburi Beach',
    description: 'A long sandy beach with coral reefs, perfect for swimming and water sports.',
    rating: 4.3,
    latitude: -4.0167,
    longitude: 39.7167,
  ),
  Destination(
    id: 'diani_beach',
    imageUrls: List.generate(
      6,
          (index) => 'assets/mombasa/diani_beach/diani${index + 1}.jpg',
    ),
    title: 'Diani Beach',
    description: 'A pristine white sandy beach with palm trees, ideal for water sports and relaxation.',
    rating: 4.7,
    latitude: -4.2667,
    longitude: 39.5667,
  ),
  Destination(
    id: 'nyali_beach',
    imageUrls: List.generate(
      5,
          (index) => 'assets/mombasa/nyali_beach/nyali${index + 1}.jpg',
    ),
    title: 'Nyali Beach',
    description: 'A suburban beach near Mombasa with family-friendly activities and coral gardens.',
    rating: 4.4,
    latitude: -4.0333,
    longitude: 39.6833,
  ),
  Destination(
    id: 'shimba_hills_national_reserve',
    imageUrls: List.generate(
      6,
          (index) => 'assets/mombasa/shimba_hills_national_reserve/shimba${index + 1}.jpg',
    ),
    title: 'Shimba Hills National Reserve',
    description: 'A coastal forest reserve with elephants, sable antelopes, and stunning ocean views.',
    rating: 4.2,
    latitude: -4.2500,
    longitude: 39.4000,
  ),
  Destination(
    id: 'tiwi_beach',
    imageUrls: List.generate(
      6,
          (index) => 'assets/mombasa/tiwi_beach/tiwi${index + 1}.jpg',
    ),
    title: 'Tiwi Beach',
    description: 'A quiet beach with yellow sands and rock pools, great for snorkeling.',
    rating: 4.2,
    latitude: -4.2333,
    longitude: 39.6167,
  ),
  Destination(
    id: 'tsavo_east_national_park',
    imageUrls: List.generate(
      5,
          (index) => 'assets/mombasa/tsavo_east_national_park/teast${index + 1}.jpg',
    ),
    title: 'Tsavo East National Park',
    description: 'Known for its red elephants and the longest lava flow, the Yatta Plateau, in a vast savannah.',
    rating: 4.3,
    latitude: -2.9167,
    longitude: 38.7500,
  ),
  Destination(
    id: 'tsavo_west_national_park',
    imageUrls: List.generate(
      7,
          (index) => 'assets/mombasa/tsavo_west_national_park/twest${index + 1}.jpg',
    ),
    title: 'Tsavo West National Park',
    description: 'Features Mzima Springs, volcanic landscapes, and diverse wildlife including hippos.',
    rating: 4.4,
    latitude: -3.3667,
    longitude: 38.3500,
  ),
  // Nairobi
  Destination(
    id: 'jeevanjee_gardens',
    imageUrls: List.generate(
      4,
          (index) => 'assets/nairobi/jeevanjee_gardens/jee${index + 1}.jpg',
    ),
    title: 'Jeevanjee Gardens',
    description: 'A green oasis in Nairobi’s city center, ideal for relaxation and scenic walks.',
    rating: 4.0,
    latitude: -1.2833,
    longitude: 36.8167,
  ),
  Destination(
    id: 'karura_forest',
    imageUrls: List.generate(
      4,
          (index) => 'assets/nairobi/karura_forest/karura${index + 1}.jpg',
    ),
    title: 'Karura Forest',
    description: 'A lush urban forest with trails, waterfalls, and wildlife, perfect for nature lovers in Nairobi.',
    rating: 4.3,
    latitude: -1.2333,
    longitude: 36.8500,
  ),
  Destination(
    id: 'nairobi_national_park',
    imageUrls: List.generate(
      7,
          (index) => 'assets/nairobi/nairobi_national_park/nairobi${index + 1}.jpg',
    ),
    title: 'Nairobi National Park',
    description: 'A wildlife haven just outside Nairobi, featuring the Big Five (except elephants) against a city skyline.',
    rating: 4.5,
    latitude: -1.3833,
    longitude: 36.8667,
  ),
  // Naivasha
  Destination(
    id: 'hells_gate_national_park',
    imageUrls: List.generate(
      6,
          (index) => 'assets/naivasha/hells_gate_national_park/hells${index + 1}.jpg',
    ),
    title: 'Hell’s Gate National Park',
    description: 'Known for gorges, cliffs, and cycling opportunities.',
    rating: 4.4,
    latitude: -0.9000,
    longitude: 36.3000,
  ),
  Destination(
    id: 'lake_naivasha',
    imageUrls: List.generate(
      7,
          (index) => 'assets/naivasha/lake_naivasha/naivasha${index + 1}.jpg',
    ),
    title: 'Lake Naivasha',
    description: 'A freshwater lake with hippos, birds, and boat tours.',
    rating: 4.2,
    latitude: -0.7667,
    longitude: 36.4333,
  ),
  // Nakuru
  Destination(
    id: 'lake_nakuru_national_park',
    imageUrls: List.generate(
      6,
          (index) => 'assets/nakuru/lake_nakuru_national_park/nakuru${index + 1}.jpg',
    ),
    title: 'Lake Nakuru National Park',
    description: 'Famous for flamingos, rhinos, and diverse wildlife.',
    rating: 4.4,
    latitude: -0.3667,
    longitude: 36.0833,
  ),
  // Nanyuki
  Destination(
    id: 'mount_kenya_national_park',
    imageUrls: List.generate(
      6,
          (index) => 'assets/nanyuki/mount_kenya_national_park/kenya${index + 1}.jpg',
    ),
    title: 'Mount Kenya National Park',
    description: 'Home to Africa’s second-highest mountain, ideal for hiking.',
    rating: 4.6,
    latitude: -0.1500,
    longitude: 37.3000,
  ),
  Destination(
    id: 'ol_pejeta_conservancy',
    imageUrls: List.generate(
      5,
          (index) => 'assets/nanyuki/ol_pejeta_conservancy/olpepeta${index + 1}.jpg',
    ),
    title: 'Ol Pejeta Conservancy',
    description: 'A conservation area with rhinos and the Big Five.',
    rating: 4.5,
    latitude: 0.0167,
    longitude: 36.9167,
  ),
  // Narok
  Destination(
    id: 'masai_mara_national_reserve',
    imageUrls: List.generate(
      8,
          (index) => 'assets/narok/masai_mara_national_reserve/mara${index + 1}.jpg',
    ),
    title: 'Masai Mara National Reserve',
    description: 'Famous for the Great Migration and abundant Big Five wildlife.',
    rating: 4.8,
    latitude: -1.5000,
    longitude: 35.1667,
  ),
  // Nyeri
  Destination(
    id: 'aberdare_national_park',
    imageUrls: List.generate(
      7,
          (index) => 'assets/nyeri/aberdare_national_park/aberdare${index + 1}.jpg',
    ),
    title: 'Aberdare National Park',
    description: 'A mountainous park with waterfalls and rare wildlife.',
    rating: 4.4,
    latitude: -0.3833,
    longitude: 36.9167,
  ),
];
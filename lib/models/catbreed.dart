class CatBreed {
  final String id;
  final String name;
  final Map<String, String> weight;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final String wikipediaUrl;
  final String referenceImageId;

  CatBreed({
    required this.id,
    required this.name,
    required this.weight,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.wikipediaUrl,
    required this.referenceImageId,
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      weight: Map<String, String>.from(json['weight']),
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      description: json['description'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      indoor: json['indoor'] ?? 0,
      lap: json['lap'] ?? 0,
      adaptability: json['adaptability'] ?? 0,
      affectionLevel: json['affection_level'] ?? 0,
      childFriendly: json['child_friendly'] ?? 0,
      dogFriendly: json['dog_friendly'] ?? 0,
      energyLevel: json['energy_level'] ?? 0,
      grooming: json['grooming'] ?? 0,
      healthIssues: json['health_issues'] ?? 0,
      intelligence: json['intelligence'] ?? 0,
      sheddingLevel: json['shedding_level'] ?? 0,
      socialNeeds: json['social_needs'] ?? 0,
      strangerFriendly: json['stranger_friendly'] ?? 0,
      vocalisation: json['vocalisation'] ?? 0,
      wikipediaUrl: json['wikipedia_url'] ?? '',
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }
}

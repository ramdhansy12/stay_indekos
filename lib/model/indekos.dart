class Indekos {
  Indekos({
    required this.id,
    required this.name,
    required this.cover,
    required this.images,
    required this.price,
    required this.location,
    required this.rate,
    required this.description,
    required this.activities,
    required this.facilities,
    required this.category,
  });

  String id;
  String name;
  String cover;
  List<String> images;
  int price;
  String location;
  double rate;
  String description;
  List<Map<String, dynamic>> activities;
  List<Map<String, dynamic>> facilities;
  String category;

  factory Indekos.fromJson(Map<String, dynamic> json) => Indekos(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        location: json["location"],
        rate: json["rate"].toDouble(),
        description: json["description"],
        activities: List<Map<String, dynamic>>.from(json["activities"]),
        facilities: List<Map<String, dynamic>>.from(json["facilities"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "location": location,
        "rate": rate,
        "description": description,
        "activities": activities,
        "facilities": facilities,
        "category": category,
      };
}

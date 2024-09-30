
class Wallpaper {
  final String id;
  final String imageUrl;
  final String character; 
  final List<String> categories;
  Wallpaper(
      {required this.id,
      required this.imageUrl,
      required this.categories,
      required this.character});

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      character: json['character'] as String,
      categories: List<String>.from(json['categories'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'categories': categories,
      'character': character,
    };
  }
}

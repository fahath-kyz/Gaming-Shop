class Game {
  final String? id;
  final String title;
  final String genre;
  final String platform;
  final DateTime releaseDate;
  final double price;
  final String imageUrl;
  final String description;

  Game({
    this.id,
    required this.title,
    required this.genre,
    required this.platform,
    required this.releaseDate,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['_id'] ?? json['id'],
      title: json['title'],
      genre: json['genre'],
      platform: json['platform'],
      releaseDate: DateTime.parse(json['releaseDate']),
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'genre': genre,
      'platform': platform,
      'releaseDate': releaseDate.toIso8601String(),
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
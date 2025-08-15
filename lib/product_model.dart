class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final double rating;
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> j) {
    final r = j['rating'] ?? {};
    return Product(
      id: j['id'] ?? 0,
      title: (j['title'] ?? '').toString(),
      price: (j['price'] is int) ? (j['price'] as int).toDouble() : (j['price'] ?? 0.0).toDouble(),
      image: (j['image'] ?? '').toString(),
      category: (j['category'] ?? '').toString(),
      rating: ((r['rate'] ?? 0.0) as num).toDouble(),
      ratingCount: (r['count'] ?? 0) as int,
    );
  }
}

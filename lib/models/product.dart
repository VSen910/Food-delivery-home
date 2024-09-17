class Product {
  String title;
  String description;
  int price;
  int off;
  int originalPrice;
  String time;
  String cardImage;

  Product({
    required this.title,
    required this.description,
    required this.cardImage,
    required this.off,
    required this.originalPrice,
    required this.price,
    required this.time,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      description: json['info'] ?? '',
      cardImage: json['media']['mediaUrls'][0],
      off: json['productPricing']['off'],
      originalPrice: json['productPricing']['originalPrice'],
      price: json['productPricing']['price'],
      time: json['status']['ATVP'],
    );
  }
}

class Product {
  final int? id;
  final String name;
  final String description;
  final String brand;
  final double price;
  final int stock;
  final bool available;
  final bool freeShipping;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.price,
    required this.stock,
    required this.available,
    required this.freeShipping,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      brand: json['brand'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      stock: json['stock'] ?? 0,
      available: json['available'] ?? false,
      freeShipping: json['freeShipping'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "brand": brand,
      "price": price,
      "stock": stock,
      "available": available,
      "freeShipping": freeShipping,
    };
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://library-app-2019112027.azurewebsites.net/api/products'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }

  static Future<bool> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('https://library-app-2019112027.azurewebsites.net/api/products'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),
    );

    return response.statusCode == 201;
  }
}

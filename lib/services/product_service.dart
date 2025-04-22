import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String _url = 'https://library-app-2019112027.azurewebsites.net/api/products';

  Future<List<dynamic>> getAllProducts() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al obtener productos');
    }
  }

  Future<void> addProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productData),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al agregar producto');
    }
  }
}

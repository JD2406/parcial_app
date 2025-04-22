import 'package:flutter/material.dart';
import '../services/product_service.dart';

class HomePage extends StatelessWidget {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: FutureBuilder<List<dynamic>>(
        future: _productService.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return ListTile(
                  title: Text(p['name'] ?? 'Sin nombre'),
                  subtitle: Text('Precio: \$${p['price']?.toString() ?? '0.0'}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

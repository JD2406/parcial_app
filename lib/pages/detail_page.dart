import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text('Marca: ${product.brand}'),
            Text('Precio: \$${product.price.toStringAsFixed(2)}'),
            Text('Stock: ${product.stock} unidades'),
            Text('Disponible: ${product.available ? "Sí" : "No"}'),
            Text('Envío Gratis: ${product.freeShipping ? "Sí" : "No"}'),
          ],
        ),
      ),
    );
  }
}

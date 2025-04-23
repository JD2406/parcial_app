import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  String brand = '';
  double price = 0.0;
  int stock = 0;
  bool available = false;
  bool freeShipping = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final product = Product(
        name: name,
        description: description,
        brand: brand,
        price: price,
        stock: stock,
        available: available,
        freeShipping: freeShipping,
      );

      final success = await ProductService.addProduct(product);

      if (success) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al subir el producto')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onSaved: (value) => name = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese un nombre' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descripción'),
                onSaved: (value) => description = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese una descripción' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Marca'),
                onSaved: (value) => brand = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese una marca' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                onSaved: (value) => price = double.tryParse(value ?? '0') ?? 0,
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese un precio' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                onSaved: (value) => stock = int.tryParse(value ?? '0') ?? 0,
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese stock' : null,
              ),
              SwitchListTile(
                title: const Text('Disponible'),
                value: available,
                onChanged: (value) => setState(() => available = value),
              ),
              SwitchListTile(
                title: const Text('Envío gratis'),
                value: freeShipping,
                onChanged: (value) => setState(() => freeShipping = value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Agregar producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

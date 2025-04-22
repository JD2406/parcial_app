import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _brandController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  bool _available = true;
  bool _freeShipping = false;

  int _generateId() => DateTime.now().millisecondsSinceEpoch;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = Product(
        id: _generateId(),
        name: _nameController.text,
        description: _descriptionController.text,
        brand: _brandController.text,
        price: double.parse(_priceController.text),
        stock: int.parse(_stockController.text),
        available: _available,
        freeShipping: _freeShipping,
      );
      Navigator.pop(context, newProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(labelText: 'Marca'),
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Requerido' : null,
              ),
              SwitchListTile(
                title: const Text('Disponible'),
                value: _available,
                onChanged: (val) => setState(() => _available = val),
              ),
              SwitchListTile(
                title: const Text('Envío Gratis'),
                value: _freeShipping,
                onChanged: (val) => setState(() => _freeShipping = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

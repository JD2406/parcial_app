import '../models/product.dart';

class ProductService {
  static List<Product> getProducts() {
    return [
      Product(
        id: 1,
        name: 'Lenovo Ideapad 3',
        description: "15.6'' laptop with AMD Ryzen 5 processor and 8GB RAM",
        brand: 'Lenovo',
        price: 549.99,
        stock: 25,
        available: true,
        freeShipping: true,
      ),
      Product(
        id: 2,
        name: 'Samsung Galaxy A54',
        description: 'Mid-range Android phone with 5G and AMOLED display',
        brand: 'Samsung',
        price: 379,
        stock: 50,
        available: true,
        freeShipping: false,
      ),
      Product(
        id: 3,
        name: 'Logitech MX Master 3S',
        description: 'Ergonomic wireless mouse with USB-C fast charging',
        brand: 'Logitech',
        price: 99.95,
        stock: 120,
        available: true,
        freeShipping: true,
      ),
      Product(
        id: 4,
        name: 'Sony WH-1000XM5',
        description: 'High-end noise cancelling wireless headphones',
        brand: 'Sony',
        price: 399.99,
        stock: 10,
        available: false,
        freeShipping: false,
      ),
      Product(
        id: 5,
        name: 'HP OfficeJet Pro 9025e',
        description: 'All-in-one printer for office use with smart features',
        brand: 'HP',
        price: 229.9,
        stock: 5,
        available: true,
        freeShipping: false,
      ),
    ];
  }
}

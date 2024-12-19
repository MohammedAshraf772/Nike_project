import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Product {
  final String name;
  File? image;
  double price;
  bool isFavorite;
  double discount;

  Product({
    required this.name,
    this.image,
    required this.price,
    this.isFavorite = false,
    this.discount = 0,
  });

  double get finalPrice => price - (price * discount / 100);
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> products = [
    Product(name: 'Product 1', price: 200),
    Product(name: 'Product 2', price: 150),
    Product(name: 'Product 3', price: 300),
    Product(name: 'Product 4', price: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('متجري')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4, // تعديل نسبة العرض إلى الارتفاع
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: product),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: product.image == null
                        ? Image.asset('assets/images/download (1).png',
                            fit: BoxFit.cover)
                        : Image.file(product.image!, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name, style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('السعر: ${product.finalPrice}',
                        style: TextStyle(fontSize: 14)),
                  ),
                  IconButton(
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        product.isFavorite = !product.isFavorite;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.image == null
                ? Image.asset('assets/images/download (1).png',
                    fit: BoxFit.cover)
                : Image.file(product.image!, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('السعر: ${product.finalPrice}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('الخصم: ${product.discount}%', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('السعر الأصلي: ${product.price}',
                style: TextStyle(
                    fontSize: 16, decoration: TextDecoration.lineThrough)),
          ],
        ),
      ),
    );
  }
}

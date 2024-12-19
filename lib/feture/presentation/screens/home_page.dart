import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Nike Jordan',
      price: 302.00,
    ),
    Product(
      name: 'Nike Air Max',
      price: 752.00,
    ),
    // ... المزيد من المنتجات
  ];
  final List<String> categories = [
    'جميع الأحذية',
    'أحذية خارجية',
    'تنس',
    'أحذية رياضية',
    'أحذية رسمية',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('All Shoes Selected');
                  },
                  child: Text('All Shoes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Outdoor Selected');
                  },
                  child: Text('Outdoor'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Tennis Selected');
                  },
                  child: Text('Tennis'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Tennis Selected');
                  },
                  child: Text('Tennis'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Tennis Selected');
                  },
                  child: Text('Tennis'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Tennis Selected');
                  },
                  child: Text('Tennis'),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return Card(
                  child: Column(
                    children: [
                      Image.asset("assets/images/Aire Jordan Nike.png"),
                      Text(product.name),
                      Text('\$${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({
    required this.name,
    required this.price,
  });
}

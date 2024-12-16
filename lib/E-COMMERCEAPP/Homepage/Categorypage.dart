import 'package:flutter/material.dart';
import '../Model Class.dart';
// import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 250),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
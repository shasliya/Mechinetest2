import 'package:flutter/material.dart';
// import '../E-commerce App/product_list_page.dart';
import 'Homepage/Screen.dart';

void main() {
  runApp(Ecommerceapp());
}

class Ecommerceapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      home: ProductListPage(),
    );
  }
}
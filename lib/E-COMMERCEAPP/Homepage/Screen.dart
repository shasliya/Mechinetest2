import 'package:flutter/material.dart';
import '../Model Class.dart';
import '../Product LIst.dart';
import 'Categorypage.dart';
// import 'dummy_data.dart';
// import 'product.dart';
// import 'product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = dummyProducts;
  List<Product> filteredProducts = dummyProducts;

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find your new style...."),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(context: context, delegate: searchbycategory(filterProducts));
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context , index) {
          final product = filteredProducts[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text("${product.price}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// class searchbycategory extends SearchDelegate {
//   final Function(String) filterProducts;
//
//   searchbycategory(this.filterProducts);
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           filterProducts(query);
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     filterProducts(query);
//     return Container(); // Results will be filtered in the list
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     filterProducts(query);
//     return Container(); // Suggestions are handled in the main list
//   }
// }
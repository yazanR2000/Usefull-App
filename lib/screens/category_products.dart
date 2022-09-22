import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/product_images.dart';
class CategoryProducts extends StatelessWidget {
  CategoryProducts({super.key});

  final DummyData _dummyData = DummyData.getInstance();

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: FutureBuilder(
        future: _dummyData.getCategoryProducts(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<Map<String, dynamic>> products = _dummyData.products;
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 5,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 200,
                      child: ProductImages(products[index]['images']),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(products[index]['title']),
                      subtitle: Text(products[index]['brand']),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        products[index]['description'],
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    ListTile(
                      title: Text(
                        "\$${products[index]['price']}",
                        style: TextStyle(fontSize: 20),
                      ),
                      // trailing: Row(
                      //   children: [
                      //     Text("4.69"),
                      //     Icon(
                      //       Icons.star,
                      //       color: Colors.yellow,
                      //     ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

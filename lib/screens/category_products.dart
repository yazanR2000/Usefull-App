import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/product_images.dart';
import '../models/dark_mode.dart';
import '../models/more_inforamation.dart';

class CategoryProducts extends StatelessWidget {
  CategoryProducts({super.key});

  final DummyData _dummyData = DummyData.getInstance();
  final DarkMode _darkMode = DarkMode.getInstance();

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: _darkMode.mode['main_color'],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: _darkMode.mode['text_color'],
        ),
        backgroundColor: _darkMode.mode['main_color'],
        titleTextStyle: TextStyle(
          color: _darkMode.mode['text_color'],
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
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
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return MoreInformation(
                          ctx,
                          products[index]['thumbnail'],
                          products[index]['price'].toString(),
                          products[index]['title'],
                          products[index]['brand'],
                          products[index]['rating'].toString(),
                          products[index]['description'],
                          products[index]['stock'].toString(),
                        );
                      });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _darkMode.mode['main_color'],
                    boxShadow: [
                      BoxShadow(
                        color: _darkMode.mode['main_color'] == Colors.black
                            ? Colors.white.withOpacity(0.06)
                            : Colors.black.withOpacity(0.03),
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
                        textColor: _darkMode.mode['text_color'],
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
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      ListTile(
                        title: Text(
                          "\$${products[index]['price']}",
                          style: TextStyle(
                              fontSize: 20,
                              color: _darkMode.mode['text_color']),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

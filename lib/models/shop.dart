import 'package:flutter/material.dart';
import '../dummy_data.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  // late Future _getCategories;

  // @override
  // void initState() {
  //   super.initState();
  //   _getCategories = DummyData().getCategories();
  // }

  final List<Color> _colors = [
    const Color(0xff25316D),
    const Color(0xff5F6F94),
    const Color(0xff97D2EC),
    const Color(0xffFEF5AC),
  ];

  final DummyData _dummyData = DummyData.getInstance();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dummyData.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        
        final List<String> categories = _dummyData.categories;
        print(categories.length);
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).pushNamed('/categoryProducts',arguments: categories[index]);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _colors[index % _colors.length],
                ),
                child: FittedBox(
                  child: Text(
                    categories[index],
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            );
          },
          itemCount: categories.length,
        );
      },
    );
  }
}

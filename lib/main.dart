import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/category_products.dart';
import './users.dart';
import 'package:provider/provider.dart';
import './screens/auth.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers : [
        ChangeNotifierProvider.value(value: Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'JosefinSans',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          iconTheme: IconThemeData(color: Colors.black),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Consumer<Users>(
          builder: (_,dummy,ch) {
            return dummy.isAuth ? Home() : Auth();
          }
        ),
        routes: {
          '/categoryProducts' :(context) => CategoryProducts(),
        },
      ),
    );
  }
}

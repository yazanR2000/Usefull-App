import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/my_accounts.dart';
import '../models/shop.dart';
import '../widgets/useful_links.dart';
import '../models/dark_mode.dart';
import '../widgets/my_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DarkMode darkMode = DarkMode.getInstance();
  void _enableDarkMode() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: darkMode.mode['main_color'],
        drawer: MyDrawer(_enableDarkMode),
        
        appBar: AppBar(
          iconTheme: IconThemeData(color: darkMode.mode['text_color']),
          backgroundColor: darkMode.mode['main_color'],
          titleTextStyle: TextStyle(
            color: darkMode.mode['text_color'],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          title: const Text("Hi, Abedalraheem 👋"),
          bottom: TabBar(
            labelColor: darkMode.mode['text_color'],
            unselectedLabelColor: Colors.grey,
            indicatorColor: darkMode.mode['text_color'],
            tabs: const [
              Tab(
                icon: FaIcon(FontAwesomeIcons.shirt),
                child: Text("Shop"),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.link),
                child: Text("Useful links"),
              ),
              Tab(
                icon: Icon(Icons.person),
                child: Text("My Accounts"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Shop(),
            UsefulLinks(),
            MyAccounts(),
          ],
        ),
      ),
    );
  }
}

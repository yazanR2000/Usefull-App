import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/my_accounts.dart';
import '../models/shop.dart';
import '../widgets/useful_links.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hi, Abedalraheem 👋"),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
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

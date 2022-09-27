import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/dark_mode.dart';
class UsefulLinks extends StatelessWidget {
  UsefulLinks({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  final DarkMode _darkMode = DarkMode.getInstance();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            link("Stackoverflow", FaIcon(FontAwesomeIcons.stackOverflow), "https://stackoverflow.com/"),
            Divider(),
            
            ListTile(
              onTap: () => _launchUrl(Uri.parse("https://pub.dev/")),
              textColor: _darkMode.mode['text_color'],
              title: Text("Flutter.dev"),
              leading: FlutterLogo(),
            ),
            Divider(),
            link("Codeforces", FaIcon(FontAwesomeIcons.code), "https://codeforces.com/"),
            
            Divider(),
            link("Hackerrank", FaIcon(FontAwesomeIcons.hackerrank), "https://www.hackerrank.com/"),
            
            Divider(),
            link("Behance", FaIcon(FontAwesomeIcons.behance), "https://www.behance.net/"),
            Divider(),
            link("Dribbble", FaIcon(FontAwesomeIcons.dribbble), "https://dribbble.com/"),
          ],
        ),
      ),
    );
  }
  ListTile link(String title,FaIcon faIcon,String url){
    return ListTile(
      textColor: _darkMode.mode['text_color'],
      onTap: () => _launchUrl(Uri.parse(url)),
      title: Text(title),
      leading: faIcon,
      iconColor: _darkMode.mode['text_color'],
    );
  }
}

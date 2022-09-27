import 'dart:io';

import 'package:flutter/material.dart';
import '../models/dark_mode.dart';
import 'package:provider/provider.dart';
import '../users.dart';

class MyDrawer extends StatefulWidget {
  final Function _enableDarkMode;
  MyDrawer(this._enableDarkMode);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool? _isDarkMode;
  final DarkMode _darkMode = DarkMode.getInstance();
  @override
  void initState() {
    super.initState();
    _isDarkMode = _darkMode.mode['main_color'] == Colors.black ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: _darkMode.mode['main_color'],
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SwitchListTile(
                title: Text(
                  "Dark mode",
                  style: TextStyle(color: _darkMode.mode['text_color']),
                ),
                secondary: _isDarkMode!
                    ? const Icon(
                        Icons.dark_mode,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.sunny,
                        color: Colors.black,
                      ),
                value: _isDarkMode!,
                onChanged: (_) {
                  setState(() {
                    _isDarkMode = !_isDarkMode!;

                    switch (_isDarkMode) {
                      case true:
                        {
                          _darkMode.mode = {
                            "main_color": Colors.black,
                            "text_color": Colors.white,
                          };

                          break;
                        }
                      case false:
                        {
                          _darkMode.mode = {
                            "main_color": Colors.white,
                            "text_color": Colors.black,
                          };
                          break;
                        }
                    }
                    Navigator.of(context).pop();
                    widget._enableDarkMode();
                  });
                },
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                textColor: _darkMode.mode['text_color'],
                title: const Text("Logout"),
                leading: Icon(
                  Icons.logout,
                  color: _darkMode.mode['text_color'],
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          //backgroundColor: _darkMode.mode['main_color'],
                          title: const Text("Logout"),
                          content:
                              const Text("Are you sure you want to logout ?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<Users>(context,listen: false).logout();
                              },
                              child: const Text("YES"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text("NO"),
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
class DarkMode{
  static final DarkMode _darkMode = DarkMode();
  DarkMode(){}
  static DarkMode getInstance() => _darkMode;
  Map<String,Color> mode = {
    "main_color" : Colors.white,
    "text_color" : Colors.black
  };
}
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DummyData {
  static final DummyData _dummyData = DummyData();

  DummyData() {}
  static DummyData getInstance() {
    return _dummyData;
  }

  final List<String> _categories = [];
  final List<Map<String, dynamic>> _products = [];
  List<String> get categories => _categories;
  List<Map<String, dynamic>> get products => _products;
  static const String _baseUrl = 'https://dummyjson.com';
  Future getCategories() async {
    _categories.clear();
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/products/categories"),
      );

      final data = json.decode(response.body) as List;
      data.forEach((element) {
        _categories.add(element);
      });
      //print(_categories);
    } catch (err) {
      throw 'Somthing went wrong!';
    }
  }

  Future getCategoryProducts(String category) async {
    try {
      _products.clear();
      final response = await http.get(
        Uri.parse("$_baseUrl/products/category/$category"),
      );
      final data = json.decode(response.body)['products'] as List<dynamic>;
      data.forEach((element) {
        _products.add(element);
      });
      print(_products);
    } catch (err) {
      throw 'Somthing went wrong!';
    }
  }
}

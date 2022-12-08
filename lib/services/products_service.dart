import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-ad863-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }
  //  TODO: <List<Product>>
  Future loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
  }
}

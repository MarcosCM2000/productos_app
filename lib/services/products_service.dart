import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl =
      'https://flutter-varios-ad863-default-rtdb.firebaseio.com';
  final List<Product> products = [];

  //  TODO: Fetch de productos
}

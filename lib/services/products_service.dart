import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-ad863-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  File? newPictureFile;
  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      // create
      await createProduct(product);
    } else {
      //update
      await updateProduct(product);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);
    //  Agregar id al producto
    product.id = decodedData['name'];
    //  Agregar producto a listado de productos
    products.add(product);
    //return product.id!;
    return product.id!;
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    await http.put(url, body: product.toJson());

    //  Update listado de productos
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;
    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dk71ftwbp/image/upload?upload_preset=jdefufaz');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    //  Send request
    final streamResponse = await imageUploadRequest.send();
    //  Get resp
    final resp = await http.Response.fromStream(streamResponse);

    //  check if resp was bad
    if (resp.statusCode != 200 || resp.statusCode != 201) {
      print('error');
      print(resp.body);
      return null;
    }
    newPictureFile = null;
    final decodedData = json.decode(resp.body);
    print(decodedData['secure_url']);
    return decodedData['secure_url'];
  }
}

import 'package:flutter/material.dart';
import 'package:gd_api/data/dio_client.dart';
import 'package:gd_api/models/get_all_products_response.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    getAllCategories();
  }
  List<Product> products;
  List<Product> catProducts;
  List<dynamic> cats;
  Product selectedProduct;
  String selectedCat;
  getAllProducts() async {
    products = await DioClient.dioClient.getAllProducts();
    notifyListeners();
  }

  getAllCategories() async {
    this.cats = await DioClient.dioClient.getAllCategories();
    getCategoryProducts(cats.first);
    this.selectedCat = cats.first;
    notifyListeners();
  }

  clearCatProducts() {
    this.catProducts = null;
    notifyListeners();
  }

  getCategoryProducts(String name) async {
    clearCatProducts();
    catProducts = await DioClient.dioClient.getCategoriProducts(name);
    this.selectedCat = name;
    notifyListeners();
  }

  getProductDetils(int id) async {
    this.selectedProduct = await DioClient.dioClient.getProductDetailById(id);
    notifyListeners();
  }
}

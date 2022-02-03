import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gd_api/data/api_constants.dart';
import 'package:gd_api/models/get_all_products_response.dart';

class DioClient {
  DioClient._() {
    initDio();
  }
  static final DioClient dioClient = DioClient._();
  Dio dio;
  initDio() {
    dio = Dio();
    dio.options.baseUrl = ApiConstant.baseUrl;
  }

  Future<List<Product>> getAllProducts() async {
    Response response = await dio.get(ApiConstant.getAllProducts);
    List list = response.data;
    List<Product> products = list.map((e) => Product.fromMap(e)).toList();
    return products;
  }

  Future<List> getAllCategories() async {
    Response response = await dio.get(ApiConstant.getAllCategories);
    List list = response.data;
    return list;
  }

  Future<List<Product>> getCategoriProducts(String catName) async {
    Response response = await dio.get(ApiConstant.getCategoryProducts(catName));
    List list = response.data;
    List<Product> products = list.map((e) => Product.fromMap(e)).toList();
    return products;
  }

  Future<Product> getProductDetailById(int id) async {
    Response response = await dio.get(ApiConstant.getOneProduct(id));
    Map map = response.data;
    Product product = Product.fromMap(map);
    return product;
  }
}

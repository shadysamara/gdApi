import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gd_api/data/api_constants.dart';
import 'package:gd_api/data/sp_helper.dart';
import 'package:gd_api/models/get_all_products_response.dart';
import 'package:gd_api/models/register_request.dart';
import 'package:gd_api/models/register_response.dart';
import 'package:provider/provider.dart';

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

  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      log(registerRequest.toJson().toString());
      Response response =
          await Dio().post('register_url', data: registerRequest.toJson());
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      return registerResponse;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<RegisterResponse> login(String email, String password) async {
    try {
      Response response = await Dio()
          .post('login_url', data: {'email': email, 'password': password});
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      return registerResponse;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  getAllProductsFromGifty(BuildContext context) async {
    String url = 'get_products_url';
    Dio().get(url,
        queryParameters: {'category_id': 1, 'city': 2},
        options: Options(headers: {
          'Authorization':
              'Bearer ' + await Provider.of<SpHelper>(context).getToken()
        }));
  }
}

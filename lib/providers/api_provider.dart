import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gd_api/data/dio_client.dart';
import 'package:gd_api/data/sp_helper.dart';
import 'package:gd_api/models/get_all_products_response.dart';
import 'package:gd_api/models/register_request.dart';
import 'package:gd_api/models/register_response.dart';
import 'package:gd_api/ui/home_page.dart';
import 'package:gd_api/ui/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class ApiProvider extends ChangeNotifier {
  ApiProvider() {
    getAllCategories();
  }
  List<Product> products;
  List<Product> catProducts;
  List<dynamic> cats;
  Product selectedProduct;
  String selectedCat;
  String validateNull(String value) {
    if (value == null || value.trim().length == 0) {
      return 'required field';
    } else {
      return null;
    }
  }

  String validatePhone(String value) {
    if (value.length != 10) {
      return 'Phone must contain 10 numbers';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    if (!isEmail(value)) {
      return 'InCorrect email syntax';
    } else {
      return null;
    }
  }

  String validateConfirmedPassword(String value) {
    if (password2.text != password.text) {
      return 'Passwords are not matched';
    } else {
      return null;
    }
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  logOut(BuildContext context) {
    Provider.of<SpHelper>(context, listen: false).removeToken();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return RegisterScreen();
    }));
  }

  register(BuildContext context) async {
    log('register begin');
    RegisterRequest registerRequest = RegisterRequest(
        email: email.text,
        first_name: firstName.text,
        last_name: lastName.text,
        password: password.text,
        phone: phone.text);
    RegisterResponse response =
        await DioClient.dioClient.register(registerRequest);
    if (response != null) {
      log('register success');
      Provider.of<SpHelper>(context, listen: false)
          .setToken(response.data.accessToken);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ApiScreen();
      }));
    } else {
      log('register failed');
    }
  }

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

import 'package:flutter/material.dart';
import 'package:gd_api/data/dio_client.dart';
import 'package:gd_api/providers/api_provider.dart';
import 'package:gd_api/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ApiProvider>(
    create: (context) {
      return ApiProvider();
    },
    child: MaterialApp(home: ApiScreen()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            DioClient.dioClient.getAllProducts();
          },
        ),
      ),
    );
  }
}

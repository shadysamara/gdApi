import 'package:flutter/material.dart';
import 'package:gd_api/data/dio_client.dart';
import 'package:gd_api/data/sp_helper.dart';
import 'package:gd_api/providers/api_provider.dart';
import 'package:gd_api/providers/passengers_provider.dart';
import 'package:gd_api/ui/home_page.dart';
import 'package:gd_api/ui/passengers_screen.dart';
import 'package:gd_api/ui/splach.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PassengerProvider>(
        create: (context) {
          return PassengerProvider();
        },
      ),
      ChangeNotifierProvider<ApiProvider>(
        create: (context) {
          return ApiProvider();
        },
      ),
      Provider<SpHelper>(
        create: (context) => SpHelper(),
      )
    ],
    child: MaterialApp(home: PassengersScreen()),
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

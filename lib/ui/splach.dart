import 'package:flutter/material.dart';
import 'package:gd_api/data/sp_helper.dart';
import 'package:gd_api/ui/home_page.dart';
import 'package:gd_api/ui/register_screen.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) async {
      String token =
          await Provider.of<SpHelper>(context, listen: false).getToken();
      if (token == null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RegisterScreen();
        }));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ApiScreen();
        }));
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}

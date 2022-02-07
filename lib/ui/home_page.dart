import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gd_api/data/dio_client.dart';
import 'package:gd_api/data/sp_helper.dart';
import 'package:gd_api/models/get_all_products_response.dart';
import 'package:gd_api/providers/api_provider.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Ecommerce App'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ApiProvider>(context, listen: false)
                    .logOut(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Consumer<ApiProvider>(builder: (context, provider, x) {
        return Column(
          children: [
            RaisedButton(
              onPressed: () async {
                log(await Provider.of<SpHelper>(context, listen: false)
                    .getToken());
              },
            ),
            provider.cats == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: provider.cats.map((e) {
                        return CategoryWidget(e);
                      }).toList(),
                    ),
                  ),
            Expanded(
                child: provider.catProducts == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                        itemCount: provider.catProducts.length,
                        itemBuilder: (context, index) {
                          Product product = provider.catProducts[index];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: product.image,
                                  height: 150,
                                  width: 150,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      product.title,
                                      maxLines: 1,
                                    )),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ))
          ],
        );
      }),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  String catName;
  CategoryWidget(this.catName);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ApiProvider>(builder: (context, provider, x) {
      return GestureDetector(
        onTap: () {
          provider.getCategoryProducts(this.catName);
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            decoration: BoxDecoration(
                color: provider.selectedCat == this.catName
                    ? Colors.orange
                    : Colors.blue,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              catName,
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
      );
    });
  }
}

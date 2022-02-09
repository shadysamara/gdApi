import 'package:flutter/material.dart';
import 'package:gd_api/providers/passengers_provider.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

class PassengersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Passengers Screen'),
        ),
        body: Consumer<PassengerProvider>(builder: (context, provider, x) {
          return provider.passengers == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : LazyLoadScrollView(
                  onEndOfPage: () => provider.loadMore(),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.passengers.length,
                          itemBuilder: (context, position) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 50,
                                  child: Text(provider
                                      .passengers[position].name[0]
                                      .toUpperCase()),
                                ),
                                title: Text(provider.passengers[position].name),
                                subtitle: Text(provider
                                    .passengers[position].trips
                                    .toString()),
                              ),
                            );
                          },
                        ),
                      ),
                      Visibility(
                          visible: provider.isLoading,
                          child: Card(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ))
                    ],
                  ),
                );
        }));
  }
}

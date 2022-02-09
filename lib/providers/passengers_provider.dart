import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gd_api/data/dio_client.dart';
import 'package:gd_api/models/get_all_passengers_response.dart';

class PassengerProvider extends ChangeNotifier {
  bool isLoading = false;
  int numOfPassengersInLastPage;
  PassengerProvider() {
    getPassengers();
  }
  int page = 0;
  List<Passenger> passengers = [];

  getPassengers() async {
    PassengersResponse passengersResponse =
        await DioClient.dioClient.getPassengers(page);
    this.passengers.addAll(passengersResponse.data);
    isLoading = false;
    numOfPassengersInLastPage = passengersResponse.data.length;
    notifyListeners();
  }

  loadMore() {
    if (numOfPassengersInLastPage == 10) {
      isLoading = true;

      notifyListeners();
      page++;
      getPassengers();
    }
  }
}

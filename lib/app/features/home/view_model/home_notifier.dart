import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:film_app/app/features/home/api_services/home_api_services.dart';
import 'package:film_app/app/features/home/model/show_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeNotifier with ChangeNotifier {
  List<ShowModel> showsList = [];

  Future<void> showsApiFunction() async {
    log("showsApiFunction");
    ShowResponse resp = await ShowaApiService().fetchShows();

    if (resp.status != false) {
      //  resp.showModel;
      showsList.clear();
      showsList.addAll(resp.showModel.toList());
      log(showsList.toString());
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShows() async {
    try {
      Response response = await Dio().get("https://api.tvmaze.com/shows");
      if (response.statusCode == 200) {
        log("message");
        final data = response.data as List;
        final newList = data.map((e) => ShowModel.fromJson(e)).toList();
        showsList.clear();
        showsList.addAll(newList);
      } else {}
    } on DioError {}
  }
}

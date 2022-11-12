import 'dart:developer';

import 'package:film_app/app/features/cast/api_services/cast_api_services.dart';
import 'package:film_app/app/features/cast/model/cast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CastNotifier with ChangeNotifier {
  List<CastModel> castList = [];

  Future<void> castApiFunction(int index) async {
    log("castApiFunction");
    CastResponse resp = await CastApiService().fetchCast(index);

    if (resp.status != false) {
      //  resp.showModel;
      castList.clear();
      castList.addAll(resp.castModel.toList());
      log(castList.toString());
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}

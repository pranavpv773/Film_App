import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:film_app/app/features/cast/model/cast_model.dart';

class CastApiService {
  Future<CastResponse> fetchCast(int index) async {
    log("fetchShows");

    try {
      log("try");

      Response response =
          await Dio().get("https://api.tvmaze.com/shows/$index/cast");
      if (response.statusCode == 200) {
        log("message");
        return CastResponse.fromJson(response.data, "success", true);
      } else {
        log("else");
        return CastResponse(
            status: false, message: "something Wrong", castModel: []);
      }
    } on DioError catch (e) {
      return CastResponse(status: false, message: e.toString(), castModel: []);
    } catch (e) {
      log(e.toString());
      return CastResponse(status: false, message: e.toString(), castModel: []);
    }
  }
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:film_app/app/features/home/model/show_model.dart';

class ShowaApiService {
  Future<ShowResponse> fetchShows() async {
    try {
      Response response = await Dio().get("https://api.tvmaze.com/shows");
      if (response.statusCode == 200) {
        return ShowResponse.fromJson(response.data, "msg", true);
      } else {
        return ShowResponse(
            status: false, message: "something Wrong", showModel: []);
      }
    } on DioError catch (e) {
      return ShowResponse(status: false, message: e.toString(), showModel: []);
    } catch (e) {
      log(e.toString());
      return ShowResponse(status: false, message: e.toString(), showModel: []);
    }
  }
}

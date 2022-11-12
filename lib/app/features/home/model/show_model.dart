import 'dart:convert';

List<ShowModel> showModelFromJson(String str) =>
    List<ShowModel>.from(json.decode(str).map((x) => ShowModel.fromJson(x)));

String showModelToJson(List<ShowModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowResponse {
  List<ShowModel> showModel;
  bool status;
  String message;
  ShowResponse(
      {required this.showModel, required this.message, required this.status});
  factory ShowResponse.fromJson(List<dynamic> json, String msg, bool sts) =>
      ShowResponse(
        status: sts,
        message: msg,
        showModel:
            json == [] ? [] : json.map((e) => ShowModel.fromJson(e)).toList(),
      );
}

class ShowModel {
  ShowModel({
    this.id,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.runtime,
    this.premiered,
    //  this.ended,
    // this.rating,
    //  this.webChannel,
    //  this.dvdCountry,
    this.image,
    this.summary,
    this.updated,
  });

  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  int? runtime;
  DateTime? premiered;
  // DateTime ended;
//  Rating? rating;
  // dynamic webChannel;
  // dynamic dvdCountry;
  Image? image;
  String? summary;
  int? updated;

  factory ShowModel.fromJson(Map<String, dynamic> json) => ShowModel(
        id: json["id"] ?? 0,

        name: json["name"] ?? "",
        type: json["type"] ?? "",
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),

        runtime: json["runtime"] ?? 0,

        premiered: DateTime.parse(json["premiered"] ?? 250),
        //  ended: DateTime.parse(json["ended"]),

        //  rating: Rating.fromJson(json["rating"] ?? ""),

        // webChannel: json["webChannel"],
        // dvdCountry: json["dvdCountry"],
        image: Image.fromJson(json["image"] ?? ""),
        summary: json["summary"] ?? "",
        updated: json["updated"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "runtime": runtime,
        "premiered":
            "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        // "ended":
        //     "${ended.year.toString().padLeft(4, '0')}-${ended.month.toString().padLeft(2, '0')}-${ended.day.toString().padLeft(2, '0')}",
        //  "rating": rating!.toJson(),
        // "webChannel": webChannel,
        // "dvdCountry": dvdCountry,
        "image": image!.toJson(),
        "summary": summary,
        "updated": updated,
      };
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"] ?? "",
        original: json["original"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  String? name;
  String? code;
  String? timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] ?? "",
        code: json["code"] ?? "",
        timezone: json["timezone"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

// class Rating {
//   Rating({
//     this.average,
//   });

//   double? average;

//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         average: json["average"].toDouble() ?? 0.0,
//       );

//   Map<String, dynamic> toJson() => {
//         "average": average,
//       };
// }

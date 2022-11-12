// To parse this JSON data, do
//
//     final castModel = castModelFromJson(jsonString);

import 'dart:convert';

List<CastModel> castModelFromJson(String str) =>
    List<CastModel>.from(json.decode(str).map((x) => CastModel.fromJson(x)));

class CastResponse {
  List<CastModel> castModel;
  bool status;
  String message;
  CastResponse(
      {required this.castModel, required this.message, required this.status});
  factory CastResponse.fromJson(List<dynamic> json, String msg, bool sts) =>
      CastResponse(
        status: sts,
        message: msg,
        castModel:
            json == [] ? [] : json.map((e) => CastModel.fromJson(e)).toList(),
      );
}

class CastModel {
  CastModel({
    this.person,
    this.character,
    this.self,
    this.voice,
    this.status,
    this.message,
  });

  Person? person;
  Character? character;
  bool? self;
  bool? voice;
  bool? status;
  String? message;

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        person: Person.fromJson(json["person"]),
        character: Character.fromJson(json["character"]),
        self: json["self"],
        voice: json["voice"],
      );
}

class Character {
  Character({
    this.id,
    this.url,
    this.name,
    this.image,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  Image? image;
  Links? links;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "image": image == null ? null : image!.toJson(),
        "_links": links!.toJson(),
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
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  Links({
    this.self,
  });

  Self? self;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: Self.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self!.toJson(),
      };
}

class Self {
  Self({
    this.href,
  });

  String? href;

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Person {
  Person({
    this.id,
    this.url,
    this.name,
    this.country,
    this.birthday,
    this.deathday,
    this.gender,
    this.image,
    this.updated,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  Country? country;
  DateTime? birthday;
  dynamic deathday;
  Gender? gender;
  Image? image;
  int? updated;
  Links? links;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        country: Country.fromJson(json["country"]),
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: genderValues.map![json["gender"]],
        image: Image.fromJson(json["image"]),
        updated: json["updated"],
        links: Links.fromJson(json["_links"]),
      );
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  Name? name;
  Code? code;
  Timezone? timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: nameValues.map![json["name"]],
        code: codeValues.map![json["code"]],
        timezone: timezoneValues.map![json["timezone"]],
      );
}

enum Code { US, CA, GB }

final codeValues = EnumValues({"CA": Code.CA, "GB": Code.GB, "US": Code.US});

enum Name { UNITED_STATES, CANADA, UNITED_KINGDOM }

final nameValues = EnumValues({
  "Canada": Name.CANADA,
  "United Kingdom": Name.UNITED_KINGDOM,
  "United States": Name.UNITED_STATES
});

enum Timezone { AMERICA_NEW_YORK, AMERICA_HALIFAX, EUROPE_LONDON }

final timezoneValues = EnumValues({
  "America/Halifax": Timezone.AMERICA_HALIFAX,
  "America/New_York": Timezone.AMERICA_NEW_YORK,
  "Europe/London": Timezone.EUROPE_LONDON
});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

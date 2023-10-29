import 'dart:convert';

class Characters {
  String id;
  String type;
  Attributes attributes;

  Characters({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory Characters.fromJson(Map<String, Object?> json) => Characters(
        id: json["id"] as String,
        type: json["type"] as String,
        attributes: Attributes.fromJson(json["attributes"] as Map<String,Object?>),
      );
}

class Attributes {
  String slug;
  String name;
  String born;
  Object died;
  String gender;
  String species;
  double height;
  double weight;
  String hairColor;
  String eyeColor;
  String skinColor;
  String bloodStatus;
  String maritalStatus;
  String nationality;
  Object? animagus;
  String boggart;
  String house;
  String patronus;
  String image;
  String wiki;

  Attributes({
    required this.slug,
    required this.name,
    required this.born,
    required this.died,
    required this.gender,
    required this.species,
    required this.height,
    required this.weight,
    required this.hairColor,
    required this.eyeColor,
    required this.skinColor,
    required this.bloodStatus,
    required this.maritalStatus,
    required this.nationality,
    required this.animagus,
    required this.boggart,
    required this.house,
    required this.patronus,
    required this.image,
    required this.wiki,
  });

  factory Attributes.fromJson(Map<String, Object?> json) => Attributes(
        slug: json["slug"] != null ?json["slug"] as String : "" ,
        name: json["name"] != null ?json["name"] as String : "" ,
        born: json["born"] != null ?json["born"] as String : "" ,
        died: json["died"] != null ?json["died"] as String : "" ,
        gender: json["gender"] != null ?json["gender"] as String : "" ,
        species: json["species"] != null ?json["species"] as String : "" ,
        height: json["height"] != null ? json["height"] as double : 0 ,
        weight: json["weight"] != null ?json["weight"] as double : 0 ,
        hairColor: json["hair_color"] != null ?json["hair_color"] as String : "" ,
        eyeColor: json["eye_color"] != null ?json["eye_color"] as String : "" ,
        skinColor: json["skin_color"]  != null ? json["skin_color"] as String : "" ,
        bloodStatus: json["blood_status"] != null ?json["blood_status"] as String : "" ,
        maritalStatus: json["marital_status"] != null ?json["marital_status"] as String : "" ,
        nationality: json["nationality"] != null ?json["nationality"] as String : "" ,
        animagus: json["animagus"] != null ?json["animagus"] as String : "" ,
        boggart: json["boggart"] != null? json["boggart"] as String : "",
        house: json["house"]  != null? json["house"] as String : "",
        patronus: json["patronus"] != null? json["patronus"] as String : "",
        image: json["image"] != null ?  json["image"] as String : "",
        wiki: json["wiki"] != null? json["wiki"] as String : "",
      );
}

import 'dart:convert';

class CatModel {
    CatModel({
        required this.id,
        required this.intelligence,
        required this.name,
        required this.origin,
        required this.description,
        required this.lifeSpan,
        required this.adaptability,
        this.image,
    });

    String id;
    String name;
    String origin;
    String description;
    String lifeSpan;
    int adaptability;
    int intelligence;
    ImageCat? image;

    factory CatModel.fromJson(String str) => CatModel.fromMap(json.decode(str));

   
    factory CatModel.fromMap(Map<String, dynamic> json) => CatModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        description: json["description"],
        lifeSpan: json["life_span"],
        adaptability: json["adaptability"],
        intelligence: json["intelligence"],
        image: json["image"] == null ? null : ImageCat.fromMap(json["image"]),
    );

}

class ImageCat {
    ImageCat({
        required this.id,
        required this.width,
        required this.height,
        required this.url,
    });

    String id;
    int width;
    int height;
    String url;

    factory ImageCat.fromJson(String str) => ImageCat.fromMap(json.decode(str));

  
    factory ImageCat.fromMap(Map<String, dynamic> json) => ImageCat(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"] ,
    );

}

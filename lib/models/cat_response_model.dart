// To parse this JSON data, do
//
//     final catsResponseModel = catsResponseModelFromMap(jsonString);

import 'dart:convert';

import 'cat_model.dart';

class CatsResponseModel {
    CatsResponseModel({
        required this.results,
    });

    List<CatModel> results;

    factory CatsResponseModel.fromJson(String str) => CatsResponseModel.fromMap(json.decode(str));

    factory CatsResponseModel.fromMap(Map<String, dynamic> json) => CatsResponseModel(
        results: List<CatModel>.from(json["results"].map((x) => CatModel.fromMap(x))),
    );

   
}


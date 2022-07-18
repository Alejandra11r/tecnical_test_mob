import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tecnical_test_mob/models/cat_model.dart';
import 'package:tecnical_test_mob/models/cat_response_model.dart';

class CatsProvider extends ChangeNotifier{

  final String _baseUrl = 'api.thecatapi.com';
  final String _apiKey = 'bda53789-d59e-46cd-9bc4-2936630fde39';
  
  List<CatModel> cats = []; 
  List<CatModel> cat = []; 
  List<CatModel> catsFilter = []; 


  CatsProvider(){
    getCats();
  }

  getCats() async{
    var url =
      Uri.https(_baseUrl, '/v1/breeds', 
      {'x-api-key': _apiKey});
      final response = await http.get(url);
      final data = {
        '"results"' : response.body
      };
      final catResponse = CatsResponseModel.fromJson(data.toString());
      cats = catResponse.results;
      notifyListeners();
  }

  getOneCats(String catId) async{
    var url =
      Uri.https(_baseUrl, '/v1/breeds/{$catId}', 
      {'x-api-key': _apiKey});
      final response = await http.get(url);
      final data = {
        '"results"' : response.body
      };
      final catResponse = CatsResponseModel.fromJson(data.toString());
      cat = catResponse.results;
      notifyListeners();
  }

   getCatsFilters(String filter) {
    catsFilter = [];
    if (filter.length > 0) {
      for (var i = 0; i < cats.length; i++) {
        if (cats[i].name == filter || cats[i].origin == filter || cats[i].intelligence.toString() == filter ) {
          catsFilter.add(cats[i]);
        }
      }
    }else{
      catsFilter = cats;
    }
    notifyListeners();
  }
}
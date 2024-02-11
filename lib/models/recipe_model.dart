import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipeModel{

  RecipeModel({
    this.appLabel,
    this.appCalories,
    this.appImgUrl,
    this.appUrl,
});

  String? appLabel;
  String? appImgUrl;
  String? appUrl;
  String? appCalories;
  //List<List> recipeList;

  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      appLabel: recipe['label'],
      appCalories: recipe['calories'].toString(),
      appUrl: recipe['url'],
      appImgUrl: recipe['image'],

    );
  }
/*

  Future<void> getModelData(String query) async {
    List <RecipeModel> recipeList=<RecipeModel>[];
    Uri uri = Uri.parse("https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=$query&app_id=707a4cd8&app_key=52196aad6a8f417866c398d4ced69a3d");
    http.Response response =await http.get(uri);
    Map data = jsonDecode(response.body);
    //log(data.toString());

    data['hits'].forEach((element){
      RecipeModel recipeModel=RecipeModel();
      recipeModel=RecipeModel.fromMap(element['recipe']);
      recipeList.add(recipeModel);
      log(recipeModel.toString());
    });
    recipeList.forEach((recipe){
      appLabel = recipe.appLabel;
      appCalories = (recipe.appLabel).toString();
      appImgUrl=recipe.appImgUrl;
      appUrl=recipe.appUrl;
    });
  }
*/



}
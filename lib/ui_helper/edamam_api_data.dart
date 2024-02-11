import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EdamamAPIDataModel {

  void getEdamamData() async {
    Uri uri = Uri.parse("https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=chicken&app_id=707a4cd8&app_key=52196aad6a8f417866c398d4ced69a3d");
    http.Response response = await http.get(uri);

    print(response);
  }
}

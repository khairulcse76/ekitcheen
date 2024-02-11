import 'dart:convert';
import 'dart:developer';

import 'package:ekitcheen/models/recipe_model.dart';
import 'package:ekitcheen/widgets/MySearchBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  TextEditingController searchCtrl = TextEditingController();

  String? searchItem="Potato";
//-------------------xxxxxxxxxxxxxxxxxx-------------

  List <RecipeModel> recipeList=<RecipeModel>[];
  void getData(String query) async {
    Uri uri = Uri.parse("https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=$query&app_id=707a4cd8&app_key=52196aad6a8f417866c398d4ced69a3d");
    http.Response response =await http.get(uri);
    Map data = jsonDecode(response.body);
      //log(data.toString());

      data['hits'].forEach((element){
        RecipeModel recipeModel=new RecipeModel();
        recipeModel=RecipeModel.fromMap(element['recipe']);
        recipeList.add(recipeModel);
        //log(recipeModel.toString());
      });
      
      recipeList.forEach((recipe){
        print("Label of $searchItem = ""${recipe.appLabel}");
        print("Calories of $searchItem = ""${recipe.appCalories}");
      });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    getData(searchCtrl.text);
  }
  @override
  void initState() {
    super.initState();

    getData(searchItem!);

    //getData(searchItem!);
  }
 // -------------------------xxxxxxxxxxxx--------------


  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFc1dfc4),
        title:MySearchbar(
            searchCtrl: searchCtrl,
            backgroundColor: Colors.white,
            textHint: "Find your recipe",
            onPressedIcon: (){
              if((searchCtrl.text).replaceAll(" ", "")==""){
              }else{
                searchItem=searchCtrl.text;
                setState(() {
                  getData(searchCtrl.text);
                  //print("Print Text from onPressedIcon: ${searchCtrl.text}");
                });
                searchCtrl.clear();
              }
            },
            onEditingComplete: (){
              FocusScope.of(context).requestFocus(FocusNode());
              setState(() {
                searchItem=searchCtrl.text;
                getData(searchCtrl.text);
                //print("Print Text from onEditingComplete: ${searchCtrl.text}");
              });
              searchCtrl.clear();
            }),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFc1dfc4),
                    Color(0xFFdeecdd),
                  ])
            ),
            child:  Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:  const EdgeInsets.only(left: 15, right: 10, top: 8, bottom: 5),
                    child:  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Any cooking plans for today?", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40, color: Colors.black),),
                        Text("Let's Coock Something New", style: TextStyle(fontSize: 24, color: Colors.black)),
                      ],
                    ),
                ),

              ],
            ),
          )
        ],
      ),
    );//Scaffhold Close
  }
}

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
        RecipeModel recipeModel=RecipeModel();
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
        backgroundColor: const Color(0xFFc1dfc4),
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
            decoration:  const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFc1dfc4),
                    Color(0xFFdeecdd),
                  ])
            ),
            child:  SingleChildScrollView(
              child: Column(
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
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recipeList.length,
                      itemBuilder: (context, index) {
                      return  Card(
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  recipeList[index].appImgUrl.toString(),
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                              left: 0,
                              right: 0,
                                child: Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  decoration:const BoxDecoration(
                                    color: Colors.white70,
                                  ),
                                    child: Text(recipeList[index].appLabel.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),),
                            ),
                             Positioned(
                              right: 0,
                              top: 0,

                                child: Container(
                                  padding:EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(15),
                                    )
                                  ),
                                  child:   Row(
                                    children: [
                                      const Icon(FontAwesomeIcons.fire, size: 15,color: Colors.red,),
                                      const SizedBox(width: 5,),
                                      Text(
                                        recipeList[index].appCalories.toString().substring(0,7)
                                      ),
                                    ],
                                  )
                                ),
                            )
                          ],
                        ),
                      );
                    },),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );//Scaffhold Close
  }
}

Widget MyWidgets() {

  return Text('Data from Widgets');
}

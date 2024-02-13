import 'dart:math';

import 'package:ekitcheen/activity/splash_activity.dart';
import 'package:flutter/material.dart';

import 'activity/home_activity.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Creating Random Recipe for Default Home Pages Search
    var recipeList = ['Allrecipes','The Food Network','Yummly','Epicurious','Tasty','Spoonacular','Delish','Edamam'
                      'Joy the Baker','Foodie Crush','King Arthur Baking','Kitchen','Food and Lemons','The Pioneer Woman','Food52'];
    var _rendom=Random();
    var rendomRecipeName=recipeList[_rendom.nextInt(recipeList.length)];


    return MaterialApp(
      title: 'eKitchen',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),

      home:MySplashActivity(),
    );
  }
}
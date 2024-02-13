import 'dart:math';
import 'package:source_span/source_span.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ekitcheen/activity/home_activity.dart';
import 'package:flutter/material.dart';

class MySplashActivity extends StatelessWidget {
   MySplashActivity({super.key});

Duration splashDuration = Duration(seconds: 4);

  @override
  Widget build(BuildContext context) {
    var recipeList = ['Allrecipes','The Food Network','Yummly','Epicurious','Tasty','Spoonacular','Delish','Edamam'
        'Joy the Baker','Foodie Crush','King Arthur Baking','Kitchen','Food and Lemons','The Pioneer Woman','Food52'];
    var _random = Random();
    var RandomRecipe=recipeList[_random.nextInt(recipeList.length)];
    
    Future.delayed(splashDuration, (){
      Navigator.pushReplacement(context,   MaterialPageRoute(builder: (context)=>HomeActivity(RandomRecipe)));
    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width,
              color: const Color(0xFFc1dfc4),
              child:  const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Image.asset('images/weather.png'),
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Color(0xFFc1dfc4),
                    backgroundImage: AssetImage("assets/images/logos/recipe_with_bg.png",),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Easy Finding Recipe', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 35),),
                  ),
                  SpinKitPianoWave(
                    color: Colors.black,
                    size: 150.0,
                  ),
                  //Text('Made by: SM Khairul Islam', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),),
                ],
              )

          ),
        ),
      ),
     /* bottomNavigationBar: BottomAppBar(
        color: Color(0xFFc1dfc4), // Set your desired color
        child: Text('Made by: SM Khairul Islam', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),),
      ),*/
      bottomSheet: Container(
        color: Color(0xFFc1dfc4),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: const Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Made by: SM Khairul Islam', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
                ],
              ),
              Positioned(
                bottom: 7,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Data From Open EDaMaM API ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),)],
                  ),
              )
    ],
        //Text('Data from EDaMaM API', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),),
      ),
    ),
    );
  }
}

import 'package:flutter/material.dart';

import 'activity/home_activity.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eKitchen',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),

      home:  const HomeActivity(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title:Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextField(
              controller: searchCtrl,
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.searchengin, color: Colors.white,)),
                hintText: "Search Something",
                border: InputBorder.none,
              ),
            
            ),
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
    );//Scaffhold Close
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySearchbar extends StatelessWidget {
  MySearchbar(
      {super.key,
      required this.searchCtrl,
      this.textHint = "Search",
      this.iconColor = Colors.blue,
      this.backgroundColor = Colors.green,
      required this.onPressedIcon,
      required this.onEditingComplete});

  TextEditingController searchCtrl;
  String? textHint;
  Color? iconColor;
  Color? backgroundColor;
  void Function()? onPressedIcon;
  void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextField(
          controller: searchCtrl,
          decoration: InputDecoration(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            suffixIcon: IconButton(
                onPressed: onPressedIcon,
                icon: Icon(
                  FontAwesomeIcons.searchengin,
                  color: iconColor,
                )),
            hintText: textHint,
            border: InputBorder.none,
          ),
          onEditingComplete: onEditingComplete,
        ),
      ),
    );
  }
}

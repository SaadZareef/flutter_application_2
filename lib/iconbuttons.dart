import 'package:flutter/material.dart';

class IconsButtons extends StatefulWidget {
  @override
  State<IconsButtons> createState() => _IconsButtonsState();
}

class _IconsButtonsState extends State<IconsButtons> {
  //    BOOLS FOR ICONS
  bool ispressed11 = true;
  bool ispressed22 = false;
  bool ispressed33 = false;
  //    LIST OF ICONS
  List<IconData> icondata = [
    Icons.house_outlined,
    Icons.favorite_outlined,
    Icons.people
  ];
  //    CONDITIONS FOR ACTIVE ICONS
  List<bool> pressed(bool press1, bool press2) {
    if (press1) {
      if (press2) {
        return [ispressed11 = true, ispressed22 = false, ispressed33 = false];
      } else {
        return [ispressed11 = false, ispressed22 = true, ispressed33 = false];
      }
    } else {
      return [ispressed11 = false, ispressed22 = false, ispressed33 = true];
    }
  }

  //    THE BUTTONS FOR ICONS
  FloatingActionButton floatingbutton(
      int i, bool press1, bool press2, bool ispressed) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        setState(() {
          pressed(press1, press2);
        });
      },
      child: Icon(
        icondata[i],
        size: 35,
        color: ispressed ? Color.fromARGB(255, 241, 144, 157) : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        floatingbutton(0, true, true, ispressed11),
        floatingbutton(1, true, false, ispressed22),
        floatingbutton(2, false, false, ispressed33),
      ],
    );
  }
}

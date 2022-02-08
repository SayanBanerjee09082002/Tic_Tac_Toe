import 'dart:ui';

import 'package:flutter/material.dart';

class MainScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/menu_bg.jpg'),
        fit: BoxFit.fill,
      )),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
        child: new Container(),
      ),
    );
  }
}

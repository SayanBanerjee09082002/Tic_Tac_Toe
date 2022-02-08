import 'package:flutter/material.dart';
import '/bg.dart';
import '/pallete.dart';
import '/play.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      MainScr(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(children: [
            Container(
                height: 100,
                child: Center(child: Text('TIC-TAC-TOE', style: Heading))),
            SizedBox(height: 450),
            ElevatedButton(
              child: Text('PLAY', style: Button1),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(125.0, 45.0), primary: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Player()));
              },
            ),
          ])))
    ]);
  }
}

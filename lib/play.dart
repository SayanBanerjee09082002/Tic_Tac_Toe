import 'package:flutter/material.dart';
import '/pallete.dart';
class Player extends StatefulWidget {
  @override
  Play createState() => Play();
}

int x = 0, y = 0;

class Play extends State<Player> {
  int a = 2, trial = 0;
  List<String> sym = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [Text("PLAYER X", style: Score), Text("$x", style: Score)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [Text("PLAYER O", style: Score), Text("$y", style: Score)]),
                  )
                ])))),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          tapped(index);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Center(child: Text(sym[index], style: Game))));
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  NewGame();
                },
                child: Text('New Game'),
            style: ElevatedButton.styleFrom(primary: Colors.deepOrange))
          ],
        ));
  }

  void tapped(int index) {
    setState(() {
      if (a % 2 == 0 && sym[index] == '') {
        sym[index] = 'X';
        trial = trial + 1;
        a = a + 1;
      }
      if (a % 2 != 0 && sym[index] == '') {
        sym[index] = 'O';
        trial = trial + 1;
        a = a + 1;
      }
      checkwinner();
    });
  }

  void checkwinner() {
    if (sym[0] == sym[1] && sym[0] == sym[2] && sym[0] != '') {
      win(sym[0]);
    }
    if (sym[3] == sym[4] && sym[3] == sym[5] && sym[3] != '') {
      win(sym[3]);
    }
    if (sym[6] == sym[7] && sym[6] == sym[8] && sym[6] != '') {
      win(sym[6]);
    }
    if (sym[0] == sym[3] && sym[0] == sym[6] && sym[0] != '') {
      win(sym[0]);
    }
    if (sym[1] == sym[4] && sym[1] == sym[7] && sym[1] != '') {
      win(sym[1]);
    }
    if (sym[2] == sym[5] && sym[2] == sym[8] && sym[2] != '') {
      win(sym[2]);
    }
    if (sym[0] == sym[4] && sym[0] == sym[8] && sym[0] != '') {
      win(sym[0]);
    }
    if (sym[2] == sym[4] && sym[2] == sym[6] && sym[2] != '') {
      win(sym[2]);
    } else if (trial == 9) {
      draw();
    }
  }

  void NewGame() {
    clear();
    x = 0;
    y = 0;
  }

  void win(String winner) {
    if (winner == 'X') {
      x = x + 1;
    }
    if (winner == 'O') {
      y = y + 1;
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner),
            actions: <Widget>[
              FlatButton(
                child: Text('Play Again!'),
                onPressed: () {
                  clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void draw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: <Widget>[
              FlatButton(
                child: Text('Play Again!'),
                onPressed: () {
                  clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        sym[i] = '';
      }
    });
    trial = 0;
  }
}

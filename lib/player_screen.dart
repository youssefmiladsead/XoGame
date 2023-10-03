import 'package:flutter/material.dart';
import 'package:xo/xo_game.dart';

class PlayerScreen extends StatelessWidget {
  static const String routename = 'player';
  String player1name = '';

  String player2name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to XO',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                  label: Text(
                'Player1',
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
              )
              ),
              onChanged:(text){
                player1name=text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text(
                'Player2',
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
              )),
              onChanged:(text){
                player2name=text;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, XoGameScreen.routename,
                  arguments: XoGameBoardArgs(player1Name: player1name, player2Name: player2name));
                },
                child: Text("Go To Game"))
          ],
        ),
      ),
    );
  }
}

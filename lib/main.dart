import 'package:flutter/material.dart';
import 'package:xo/player_screen.dart';
import 'package:xo/xo_game.dart';

void main(){
  runApp(xo());
}

class xo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayerScreen.routename,
      routes: {
        XoGameScreen.routename : (context) => XoGameScreen(),
        PlayerScreen.routename : (context) => PlayerScreen(),
      },
    );
  }
}

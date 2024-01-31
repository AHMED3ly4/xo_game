import 'package:flutter/material.dart';
import 'package:xo_game/game_screen.dart';

void main() {
  runApp(XoGame());
}

class XoGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameScreen.routeName: (_) => GameScreen(),
      },
      initialRoute:GameScreen.routeName ,
      debugShowCheckedModeBanner: false,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_screen.dart';
import 'package:xo_game/screens/home_screen.dart';

void main() {
  runApp(XoGame());
}

class XoGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameScreen.routeName: (_) => GameScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute:HomeScreen.routeName ,
      debugShowCheckedModeBanner: false,

    );
  }
}

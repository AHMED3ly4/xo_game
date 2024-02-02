import 'package:flutter/material.dart';
import 'package:xo_game/screens/game_screen.dart';
import 'package:xo_game/tools/my_text_field.dart';

import '../tools/home_screen_args.dart';

class HomeScreen extends StatelessWidget {
static const routeName='home screen route';
TextEditingController firstPlayerName =TextEditingController();
TextEditingController secondPlayerName= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('X ',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  ),
                  Text('| ',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text('O ',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange
                  ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextField(label: 'First player name',playerName: firstPlayerName),
              const SizedBox(height:12),
              MyTextField(label: 'Second player name',playerName: secondPlayerName),
              const SizedBox(height: 30,),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    Colors.blue,
                    Colors.deepOrange,
                  ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  ),
                ),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(
                        context,
                        GameScreen.routeName,
                        arguments: HomeScreenArgs(firstPlayerName.text, secondPlayerName.text),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.transparent
                  ),
                    child:  const Text(
                      'Lets Play',
                      style: TextStyle(fontSize: 25,
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


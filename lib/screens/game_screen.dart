import 'package:flutter/material.dart';
import 'package:xo_game/tools/cell.dart';
import 'package:xo_game/tools/home_screen_args.dart';

class GameScreen extends StatefulWidget {
static const routeName = 'game screen';
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int turn =1;
  int player1Score =0;
  int player2Score =0;
  void onCellClicked(int index){
    if(cells[index].isEmpty){
      if (turn.isOdd) {
        cells[index] = 'X';
        if(isWin('X')){
          player1Score++;
          newRound();
        }else{
          turn++;
        }
      } else {
        cells[index] = 'O';
        if(isWin('O')){
          player2Score++;
          newRound();
        }else{
          turn++;
        }
      }
      if(turn>9){newRound();}
    }
    setState(() {

    });
  }
  bool isWin(String whoseTurn){
    if(turn.isOdd){
      whoseTurn='X';
    }else{
      whoseTurn='O';
    }
    if (cells[0] == whoseTurn &&
        cells[4] == whoseTurn &&
        cells[8] == whoseTurn){
      return true;
    }
    if (cells[2] == whoseTurn &&
        cells[4] == whoseTurn &&
        cells[6] == whoseTurn){
      return true;
    }
    for(int i=0;i<=6;i+=3){
      if (cells[i] == whoseTurn &&
          cells[i] == cells[i + 1] &&
          cells[i] == cells[i + 2]) {
        return true;
      }
    }
    for(int i=0;i<=2;i++){
      if (cells[i] == whoseTurn &&
          cells[i+3] == whoseTurn &&
          cells[i+6] == whoseTurn) {
        return true;
      }
    }
    return false;
  }
  void newRound(){
    cells=List.generate(9, (index) => '');
    turn=1;
  }

  List<String> cells=List.generate(9, (index) => '');
  @override
  Widget build(BuildContext context) {
    HomeScreenArgs args = ModalRoute.of(context)!.settings.arguments as HomeScreenArgs;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'X_o Game',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${args.firstPlayer} : $player1Score',
                style: const TextStyle(fontSize: 30,color: Colors.blue),
                ),
                Text('${args.secondPlayer} : $player2Score',
                style: const TextStyle(fontSize: 30,color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context,index)=>Cell(text: cells[index],whatToDo: onCellClicked,index: index),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cells.length,
            ),
          ),
        ],
      ),
    );
  }
}

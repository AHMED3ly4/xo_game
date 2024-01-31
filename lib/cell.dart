import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  String text;
  int index;
  void Function(int) whatToDo;
  Cell({required this.text,required this.whatToDo,required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ElevatedButton(
          onPressed: (){
            whatToDo(index);
          },
          child: Text(text,
              style: TextStyle(fontSize: 45),
          ),
        style: ElevatedButton.styleFrom(
          elevation:0,
          fixedSize: Size.fromWidth(double.infinity),
        ),
      ),
    );
  }
}

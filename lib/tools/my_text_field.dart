import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String label;
  TextEditingController playerName;
  MyTextField({required this.label,required this.playerName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: playerName,
        style: TextStyle(
          color: label == 'First player name' ?  Colors.blue: Colors.deepOrange,
          fontSize: 20,
        ),
        cursorColor:label == 'First player name' ?  Colors.blue: Colors.deepOrange ,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
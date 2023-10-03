import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  int index;
  Function onButtonClicked;
  BoardButton({required this.text,required this.index,required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () {
          onButtonClicked(index);
        },
        child: Text(text, style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ));
  }
}

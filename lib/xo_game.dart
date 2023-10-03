import 'package:flutter/material.dart';
import 'package:xo/board_button.dart';

class XoGameScreen extends StatefulWidget {
  static const String routename = 'xo';

  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
int player1score = 0 ;
  int player2score = 0 ;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as XoGameBoardArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Xo Game', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(args.player1Name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text( '$player1score'
                      ,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(args.player2Name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('$player2score',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(
                  text: boardState[0],
                  index: 0,
                  onButtonClicked: onButtonClick),
              BoardButton(
                  text: boardState[1],
                  index: 1,
                  onButtonClicked: onButtonClick),
              BoardButton(
                  text: boardState[2],
                  index: 2,
                  onButtonClicked: onButtonClick),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(
                  text: boardState[3],
                  index: 3,
                  onButtonClicked: onButtonClick),
              BoardButton(
                  text: boardState[4],
                  index: 4,
                  onButtonClicked: onButtonClick),
              BoardButton(
                  text: boardState[5],
                  index: 5,
                  onButtonClicked: onButtonClick),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(
                  text: boardState[6],
                  index: 6,
                  onButtonClicked: onButtonClick),
              BoardButton(
                  text: boardState[7],
                  index: 7,
                  onButtonClicked: onButtonClick),
              BoardButton(
                  text: boardState[8],
                  index: 8,
                  onButtonClicked: onButtonClick),
            ],
          )),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    if (boardState[index].isNotEmpty) {
      return; //مينفعش اعدل في الزرار
    }
    if (counter % 2 == 0) {
      boardState[index] = 'x';
      // دايما ال x بتبقي في المرة الفردية لللعب
    } else {
      boardState[index] = 'o';
      // دايما ال o بتبقي في المرة الزوجية لللعب
    }
    counter++;
    if(checkWinner('x')){
       player1score+=5;
       initboard();
    }
    else if(checkWinner('o')){
      player2score+=5;
      initboard();
    }
    else if(counter == 9){
      initboard();
      // اعرف منين اني اللعبة قفلت لما يساوي 9
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
        //الصف
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
        //العمود
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
      // قطري
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
      //ديجونل يعني قطري
    }
    return false;
    // محدش كسب
  }
  void initboard(){ //علشان لما اخلص ابدا من الاول
    boardState = [
      '', '', '',
      '', '', '',
      '', '', '',
    ];
    counter = 0;
    //علشان اعد من الاول وجديد
  }

}

class XoGameBoardArgs{
  String player1Name ;
  String player2Name ;
  XoGameBoardArgs({required this.player1Name, required this.player2Name});
}


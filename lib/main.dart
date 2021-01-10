import 'package:flutter/material.dart';
import 'quiz_brain.dart';



QuizBrain quizBrain=QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Quizepage(),
        ),

      ),

    );
  }
}
class Quizepage extends StatefulWidget {
  @override
  _QuizepageState createState() => _QuizepageState();
}

class _QuizepageState extends State<Quizepage> {
List <Icon> scorekeeper=[];

void checkanswer(bool userpicked){
  bool correctanswer= quizBrain.getquestionanswer();
  setState(() {
  if(correctanswer== userpicked){

    scorekeeper.add(Icon(Icons.check, color: Colors.green,));
  }else {
    scorekeeper.add(Icon(Icons.close, color: Colors.red,));
  }
    quizBrain.getnumber();
  });
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
       Expanded(
         flex: 5,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Center(
             child: Text(quizBrain.getquestiontext(),
           textAlign: TextAlign.center,
             style: TextStyle(
             fontSize: 25.0,
                 color: Colors.white,
             ),
           ),
           ),
         ),
       ),
        Expanded(
          child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: FlatButton(
            onPressed: (){
             checkanswer(true);
            },
            child: Text('true',
              style: TextStyle(fontSize: 20.0,
              color: Colors.white
    ),
    ),
          color: Colors.green,
    ),
        ),
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
          onPressed: (){
            checkanswer(false);
          },
          child: Text('false',
              style: TextStyle(fontSize: 20.0,
              color: Colors.white,
              ),
          ),
          color: Colors.red,
        ),
            )
        ),
      Row(
        children: scorekeeper,
      )
      ],
    );
  }
}



/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

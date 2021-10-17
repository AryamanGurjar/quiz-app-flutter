// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:glass_kit/glass_kit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'splash.dart';
import 'Analysis.dart';





void main() => runApp(MaterialApp(
  home: SecondPage(), ));//after this go to splash.dart file -- Quizzler


int correct = 0;
int wrong =0;



//main UI page
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

//
class _QuizPageState extends State<QuizPage> {
//   List<String> question = [
//     'You can lead a cow down stairs but not up stairs.',
//      'Approximately one quarter of human bones are in the feet.',
//      'A slug\'s blood is green.'
//
//   ];
//  List<bool> answer=[
//    false,
//    true,
//    true
// //  ];
//  Question q1 = Question(q :'You can lead a cow down stairs but not up stairs.',a: false );
//  Question q2 = Question(q: 'Approximately one quarter of human bones are in the feet.',a: true);
//  Question q3 = Question(q: 'A slug\'s blood is green',a: true);

  Quiz_brain question_bank = Quiz_brain();
  bool correct_answer;





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(

        children: [
          // SizedBox(
          //   height: 10.0,
          // ),
          // Image.network('https://media4.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.gif',height: 110.0),
          SizedBox(
            height: 60.0,
          ),
          GlassContainer(
            //alignment: Alignment.center,
            height: 500.0,
            width: 400.0,
            gradient: LinearGradient(
              colors: [
                Colors.blue[200].withOpacity(0.40),
                Colors.blue[200].withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.60),
                Colors.blue.withOpacity(0.10),
                Colors.blue.withOpacity(0.05),
                Colors.blue.withOpacity(0.60),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.39, 0.40, 1.0],
            ),
            blur: 20,
            borderRadius: BorderRadius.circular(24.0),
            borderWidth: 1.0,
            elevation: 3.0,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                // Text('$(correct+wrong)',style: ,)
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(


                      child: Text(
                        question_bank.get_question(),

                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,

                            color: Colors.white,
                          ),
                        ),

                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FlatButton(

                      //  textColor: Colors.blue.shade700,
                      color: Colors.white,
                      child: GradientText(
                        'True',
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            //color: Colors.blue.shade500,
                            fontSize: 25.0,
                          ),
                        ),
                        colors: [Colors.blue[900],Colors.blue],
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        correct_answer = question_bank.get_answer();
                        if(correct_answer == true){

                          setState(() {
                            if((correct + wrong) <16){correct++;question_bank.next_question();}

                          });}

                        else if(correct_answer == false){
                          //wrong ++;
                          setState(() {
                            //                    que_number++;
                            //  correct++;
                            if((correct + wrong) <16){wrong++;question_bank.next_question();}

                            // Navigator.push(context, ScaleTransition1(Analysis()));
                          });
                        }
                        if((correct + wrong) >= 16){

                          Navigator.push(context, ScaleTransition1(Analysis()));


                        }


                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FlatButton(
                      color: Colors.white,
                      child: GradientText(

                        'False',
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            // color: Colors.blue.shade700,
                            fontSize: 25.0,
                          ),
                        ),
                        colors: [Colors.blue[900],Colors.blue],
                      ),
                      onPressed: () {
                        correct_answer = question_bank.get_answer();
                        if(correct_answer == false){
                          setState(() {
                            //                    que_number++;
                            //  correct++;

                            if((correct + wrong) <16){correct++;question_bank.next_question();}


                          });}
                        else if(correct_answer == true){

                          setState(() {
                            //                    que_number++;
                            //  correct++;
                            if((correct + wrong) <16){wrong++;question_bank.next_question();}


                          });
                        }
                        // elseif(corre) {
                        //   wrong++;
                        //   question_bank.next_question();
                        // }
                        if((correct + wrong) >= 16){


                          Navigator.push(context, ScaleTransition1(Analysis()));

                        }

                        //The user picked false.
                      },
                    ),
                  ),
                ),

              ],

            ),
          ),
          // Text('$correct   $wrong'),
          // ConcentricPageView(itemCount: 1,itemBuilder: (2){return Container()}, colors: <Color>[Colors.white, Colors.blue],physics: NeverScrollableScrollPhysics(),)

        ],
      ),


    );


  }
}


class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 3500),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return ScaleTransition(
        alignment: Alignment.bottomCenter,
        scale: animation,
        child: child,
      );
    },
  );
}





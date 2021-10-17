// @dart=2.9
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';


class hime_page extends StatelessWidget {
  const hime_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=> showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title: Text('Do you really want to exit 🙃?'),
            actions: [
              RaisedButton(
                  child: Text ('exit '),
                  onPressed: () => SystemNavigator.pop()),
              RaisedButton(
                  child: Text ('cancel '),
                  onPressed: () => Navigator.of(context).pop(false)),
            ],

          )),
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            leading: Icon(Icons.account_circle_rounded,color: Colors.white,size: 60,),
            leadingWidth: 0,
            title: Center(child: Text('QUIZZLER',style: GoogleFonts.righteous(fontWeight: FontWeight.bold,fontSize: 35.0),)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(6),
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  colors: [Colors.blue,Colors.blue[900]]
              )
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

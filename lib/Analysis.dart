// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'home.dart';

import 'package:flutter/services.dart';


void Values(){
  correct =0;
  wrong =0;

}





class Analysis extends StatefulWidget {
  const Analysis({Key key}) : super(key: key);

  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {

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
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            leadingWidth: 0,
            leading: Icon(Icons.account_circle_rounded,color: Colors.white,size: 60,),

            title: Center(child: Text('ANALYSIS',style: GoogleFonts.righteous(fontWeight: FontWeight.bold,fontSize: 30.0),)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(6),
              ),
            ),
          ),
        ),

        body: Container(
//color: Colors.black,
          height: double.infinity,width: double.infinity,
          // color: Colors.black,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade600,Colors.blue.shade800,]
            ),
          ),
          child: Column(

            children: [
              //Text('hi')
              SizedBox(height: 50),
              SlimyCard(
                // width: 320.0,
                color: Colors.white,
                topCardHeight: 330.0,
                bottomCardHeight: 100.0,
                topCardWidget: topCardWidget(),
                bottomCardWidget: bottomCardWidget(),

                //slimeEnabled: true,
              ),
              // LiquidSwipe(pages: pages,
              //   fullTransitionValue: 300,
              //   waveType: WaveType.liquidReveal,
              //  ),
              SizedBox(height: 25.0,),


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {

            Values();
            Navigator.push(context, ScaleTransition1(hime_page()));

          },
          label: const Text('START AGAIN 😇😇',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
          //icon: const Icon(Icons.thumb_up),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}


// This widget will be passed as Top Card's Widget.
Widget topCardWidget() {

  return Chart();

}

// This widget will be passed as Bottom Card's Widget.
Widget bottomCardWidget() {
  return Container(
    child:  Text('Correct = $correct   Wrong = $wrong',style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 18.8),),
  );
}



class Chart extends StatefulWidget {
  const Chart({Key key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  List<PieChartSectionData> sections = List<PieChartSectionData>();


  @override

  void initState(){
    super.initState();
    PieChartSectionData item1 = PieChartSectionData(color: Colors.green,value: ((correct/16)*100),title: ('CORRECT'),radius: 100,titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24));
    PieChartSectionData item2 = PieChartSectionData(color: Colors.red,value: (((16-correct)/16)*100),title: ('WRONG'),radius: 100,titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24));
    sections=[item2,item1];
  }

  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 1,
        child: FlChart(
          chart: PieChart(
              PieChartData(
                sections: sections,
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 25,
                sectionsSpace: 0,
              )
          ),
        ),
      ),
    );
  }
}


class ScaleTransition1 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2500),

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





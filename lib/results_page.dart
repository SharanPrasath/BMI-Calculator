import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/reuse_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({this.BMIresult,this.BMInumber,this.BMIcomment});
  final String BMIresult;
  final String BMInumber;
  final String BMIcomment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Results', style: kTitleTextStyle ,))),

          Expanded(
            flex: 5,
            child: ReuseCard(
              colour: kactiveContainercolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(BMIresult.toUpperCase(), style: kResultsTextStyle,),
                  Text(BMInumber,style:kBMItextstyle,),
                  Text(BMIcomment,style: kcommentstyle,textAlign: TextAlign.center,)
                ],
              ),

          ),
          ),
          BottomButton(ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculator()));
          }, text: 'RE-CALCULATE')
        ],
      ),
    );
  }
}

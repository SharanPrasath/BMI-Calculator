import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_column.dart';
import 'reuse_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender{
  male,
  female,
}
class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 40;
  int age = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: ReuseCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour : selectedGender == Gender.male ? kactiveContainercolor : kinactiveContainercolor,
                  cardchild: IconColumn(icon: FontAwesomeIcons.mars,
                  label: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReuseCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kactiveContainercolor : kinactiveContainercolor,
                  cardchild: IconColumn(icon: FontAwesomeIcons.venus,
                  label: 'Female',
                  ),
                ),

              ),
          ],
          ),
          ),
          Expanded(
            child: ReuseCard(colour: kactiveContainercolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Height',style: ktextvariable,)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(height.toString(),
                    style: knumberTextStyle),
                    Text('cm',style: ktextvariable,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x15EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
,                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newvalue){
                        setState(() {
                          height = newvalue.round();
                        });
    }
                  ),
                ),
              ],
            ),),
          ),

          Expanded(child: Row(
            children: [
              Expanded(
                child: ReuseCard(
                  colour: kactiveContainercolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style: ktextvariable,),
                      Text(weight.toString(),style: knumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onpressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                          onpressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),

                        ],
                      )
                    ],
                  ),
                ),

              ),
              Expanded(
                child: ReuseCard(
                  colour: kactiveContainercolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',style: ktextvariable,),
                      Text(age.toString(),style: knumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          BottomButton(

            ontap:(){
              CalculatorBrain calc  = CalculatorBrain(weight: weight,height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                BMInumber: calc.calculateBMI(),
                BMIresult: calc.getResult(),

                BMIcomment: calc.Interpretation(),
              ),
              ),
              );
            }
            ,text: 'CALCULATE',)
        ],
      ),

    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.ontap,@required this.text});
  final Function ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(child: Text(text ,style: kLargeButtonStyle)),
        color: kbottomContainercolor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom:20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onpressed });
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),


    );
  }
}



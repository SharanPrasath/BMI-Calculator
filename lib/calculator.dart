import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.weight,this.height}) ;
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>=18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }
  String Interpretation(){
    if(_bmi>=25){
      return 'You have higher than normal body weight. Try to Exercise and maintain diet ';
    }
    else if(_bmi>=18.5){
      return 'Great, you have a perfect body weight';
    }
    else{
      return 'You have a lower body weight than Normal , Try to eat more';
    }
  }

}
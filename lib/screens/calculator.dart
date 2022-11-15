import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text('Calculator'),backgroundColor: Colors.grey),
        body: Padding(padding: EdgeInsets.all(2),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(text,style: TextStyle(fontSize: 75,color: Colors.white,fontWeight: FontWeight.w500,),),
                Padding(padding: EdgeInsets.all(2)),
                Text('five',style: TextStyle(fontSize: 75,color: Colors.orange,fontWeight: FontWeight.w400),),
                Padding(padding: EdgeInsets.all(2)),
                Row(
                    children: [
                      Text('',style: TextStyle(fontSize: 75,),),]
                ),   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const[
                      MyButton(text: 'C',),
                      MyButton(text: '%',),
                      MyButton(text: '=',),
                      MyButton(text: '/',),
                    ]
                ),  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const[
                      Numbers(text: '7',),
                      Numbers(text: '8',),
                      Numbers(text: '9',),
                      MyButton(text: 'x',),
                    ]
                ),  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const[
                      Numbers(text: '4',),
                      Numbers(text: '5',),
                      Numbers(text: '6',),
                      MyButton(text: '-',),
                    ]
                ),  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const[
                      Numbers(text: '1',),
                      Numbers(text: '2',),
                      Numbers(text: '3',),
                      MyButton(text: '+',),
                    ]
                ),
              ]
          ),
        )
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){},
      color: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(text,style: const TextStyle(fontSize: 70,color: Colors.orange,fontWeight: FontWeight.w500,),),);
  }
}

class Numbers extends StatelessWidget {
  final String text;
  const Numbers({
    Key? key, required this.text,
  }) : super(key: key);

  void functions(String nText) {
    String text = '0';
    double numOne = 0;
    double numTwo = 0;

    String result = '';
    String finalResult = '';
    String operator = '';
    String preoperator = '';

    String ret(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0))
          return result = splitDecimal[0].toString();
      }
      return result;
    }

    String add() {
      result = (numOne + numTwo).toString();
      numOne = double.parse(result);
      return ret(result);
    }
    String sub() {
      result = (numOne - numTwo).toString();
      numOne = double.parse(result);
      return ret(result);
    }
    String mul() {
      result = (numOne * numTwo).toString();
      numOne = double.parse(result);
      return ret(result);
    }
    String div() {
      result = (numOne / numTwo).toString();
      numOne = double.parse(result);
      return ret(result);
    }

    if (nText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      operator = '';
      preoperator = '';

    }
    else if (operator == '=' && nText == '=') {
      if (preoperator == '+') {
        finalResult = add();
      } else if (preoperator == '-') {
        finalResult = sub();
      } else if (preoperator == 'x') {
        finalResult = mul();
      } else if (preoperator == '/') {
        finalResult = div();
      }
    } else if (nText == '+' || nText == '-' || nText == 'x' || nText == '/' ||
        nText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (operator == '+') {
        finalResult = add();
      } else if (operator == '-') {
        finalResult = sub();
      } else if (operator == 'x') {
        finalResult = mul();
      } else if (operator == '/') {
        finalResult = div();
      }
      preoperator = operator;
      operator = nText;
      result = '';
    }

    else {
      result = result + nText;
    }

    setState(() {
    text = finalResult;
    });
}

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: ()=> functions(text),
      color: Colors.white10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(text,style: const TextStyle(fontSize: 70,color: Colors.white,fontWeight: FontWeight.w500,),),);
  }
}

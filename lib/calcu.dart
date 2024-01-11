import 'main.dart';

import 'package:flutter/material.dart';


class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {


  final tec = TextEditingController();

  String operand1 = "", operand2 = "";
  String operator = "";
  bool click = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[100],
          title: Center(
              child: Text("Calculator",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30),
              ),
          ),
        ),
        
        body: Column(
      
          children: [
            SizedBox(height: 80,),


            ///result details
      
            TextFormField(
              controller: tec,
              keyboardType: TextInputType.none,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 35,
                  height: 3,),
              decoration: InputDecoration(
                filled: true,
                  border: OutlineInputBorder(),
              ),
            ),


            SizedBox(height: 20,),
      
            /// c % delet /
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.clear();
                    operand1 = "";
                    operand2 = "";
                    click = false;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("C",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.text += "%";
                    operator += "%";
                    click = true;

                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("%",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.text = tec.text.substring(0, tec.text.length - 1);
      
                    if (click) {
                      operand2 = tec.text;
                    } else {
                      operand1 = tec.text;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Icon(Icons.backspace_outlined,size: 30,color: Colors.black,),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.text += "/";
                    operator += "/";
                    click = true;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("/",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
              ],
            ),


            SizedBox(height: 20,),
      
            /// 7 8 9  x
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "7";
                      tec.text = operand2;
                    } else {
                      operand1 += "7";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("7",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "8";
                      tec.text = operand2;
                    } else {
                      operand1 += "8";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("8",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                    onPressed: (){
                      if (click) {
                        operand2 += "9";
                        tec.text = operand2;
                      } else {
                        operand1 += "9";
                        tec.text = operand1;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                    ),
                    child: Text("9",style: TextStyle(fontSize: 30,color: Colors.black),)
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.text += "*";
                    operator += "*";
                    click = true;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("x",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
              ],
            ),


            SizedBox(height: 20,),
      
            /// 4 5 6 -
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "4";
                      tec.text = operand2;
                    } else {
                    operand1 += "4";
                    tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("4",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "5";
                      tec.text = operand2;
                    } else {
                      operand1 += "5";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("5",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                    onPressed: (){
                      if (click) {
                        operand2 += "6";
                        tec.text = operand2;
                      } else {
                        operand1 += "6";
                        tec.text = operand1;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                    ),
                    child: Text("6",style: TextStyle(fontSize: 30,color: Colors.black),)
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.text += "-";
                    operator += "-";
                    click = true;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("-",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
              ],
            ),


            SizedBox(height: 20,),
      
            /// 1 2 3 +
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "1";
                      tec.text = operand2;
                    } else {
                      operand1 += "1";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("1",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "2";
                      tec.text = operand2;
                    } else {
                      operand1 += "2";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("2",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                    onPressed: (){
                      if (click) {
                        operand2 += "3";
                        tec.text = operand2;
                      } else {
                        operand1 += "3";
                        tec.text = operand1;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                    ),
                    child: Text("3",style: TextStyle(fontSize: 30,color: Colors.black),)
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    tec.text += "+";
                    operator += "+";
                    click = true;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("+",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
              ],
            ),


            SizedBox(height: 20,),
      
            /// 00 0 . =
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "00";
                      tec.text = operand2;
                    } else {
                      operand1 += "00";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("00",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                  onPressed: (){
                    if (click) {
                      operand2 += "0";
                      tec.text = operand2;
                    } else {
                      operand1 += "0";
                      tec.text = operand1;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("0",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
      
      
                ElevatedButton(
                    onPressed: (){
                      if (click) {
                        operand2 += ".";
                        tec.text = operand2;
                      } else {
                        operand1 += ".";
                        tec.text = operand1;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                    ),
                    child: Text(".",style: TextStyle(fontSize: 30,color: Colors.black),)
                ),
      
      
                ElevatedButton(
                  onPressed: () {
                    if (operator == "+") {
                      double a = double.parse(operand1);
                      double b = double.parse(operand2);
                      double res = a + b;
      
                      tec.text = res.toString();
                    }
                    if (operator == "-") {
                      double a = double.parse(operand1);
                      double b = double.parse(operand2);
      
                      double res = a - b;
      
                      tec.text = res.toString();
                    }
                    if (operator == "*") {
                      double a = double.parse(operand1);
                      double b = double.parse(operand2);
      
                      double res = a * b;
      
                      tec.text = res.toString();
                    }
                    if (operator == "%") {
                      double a = double.parse(operand1);
                      double b = double.parse(operand2);
      
                      double res = a % b;
      
                      tec.text = res.toString();
                    }
                    if (operator == "/") {
                      double a = double.parse(operand1);
                      double b = double.parse(operand2);
      
                      double res = a / b;
                      tec.text = res.toString();
                    }

                    operand1 = tec.text;
                    operand2 = "";
                    operator = "";
                    click = false;
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(30),
                  ),
                  child: Text("=",style: TextStyle(fontSize: 30,color: Colors.black),),
                ),
              ],
            ),
      
      

          ],
        ),
      ),
    );
  }
}

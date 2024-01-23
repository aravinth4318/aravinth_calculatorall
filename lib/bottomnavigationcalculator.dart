import 'package:flutter/material.dart';

import 'calcu.dart';
import 'listfuncation.dart';
import 'maximumfunction.dart';




class calcbottomnavi extends StatefulWidget {
  const calcbottomnavi({super.key});

  @override
  State<calcbottomnavi> createState() => _calcbottomnaviState();
}

class _calcbottomnaviState extends State<calcbottomnavi> {
  int _currentIndex = 0;

  final tabs = [
    calculator(),
    listfunction(),
    maximumfunction(),




  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 15,
          // unselectedFontSize: 50,
          items: [

            ///calculator

            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: Colors.black,
                size: 20,),
              label: "calculator",
              backgroundColor: Colors.grey,
            ),

            ///basiclist

            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,color: Colors.black,),
              label: "basic list",
              backgroundColor: Colors.lightGreen,
            ),

            ///maximumfunction

            BottomNavigationBarItem(
              icon: Icon(
                Icons.maximize,
                color: Colors.black,
                size: 20,),
              label: "Maximum",
              backgroundColor: Colors.green,
            ),

          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
      ),

    );
  }
}
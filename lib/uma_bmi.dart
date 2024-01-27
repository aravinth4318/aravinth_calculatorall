import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  String bmi = "";
  double result = 0;

  void calculateBmi() {
    setState(() {
      result = double.parse(weight.text) /
          ((double.parse(height.text)/100) * (double.parse(height.text)/100));

      if (result < 18.5) {
        bmi = "Underweight";
      } else if (result >= 18.5 && result < 24.9) {
        bmi = "Normal weight";
      } else if (result >= 24.9 && result < 29.9) {
        bmi = "Overweight";
      } else {
        bmi = "Obesity";
      }
    });
  }

  Color dialogColor() {
    if (bmi == 'Underweight') {
      return Colors.blue;
    } else if (bmi == 'Normal weight') {
      return Colors.green;
    } else if (bmi == 'Overweight') {
      return Colors.yellow;
    } else if (bmi == 'Obesity') {
      return Colors.red;
    } else {
      return Colors.pinkAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: weight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Weight in Kg',
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          TextFormField(
            controller: height,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Height in Cm',
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              calculateBmi();
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 300,
                    width: 400,
                    color: dialogColor(),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('BMI: ${result.toString()}'),
                        Text('Weight Status: $bmi'),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Calculate'),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
class bmii extends StatefulWidget {
  const bmii({super.key});

  @override
  State<bmii> createState() => _bmiiState();
}

class _bmiiState extends State<bmii> {
  String bmi="";
  Color color = Colors.transparent;


  final a=TextEditingController();
  final b=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: a,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "weight in kg"
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: b,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Height"
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
            var res = double.parse(a.text)/((double.parse(b.text)/100)*(double.parse(b.text)/100));
            if(res<18.5){
              bmi="Underweight";
              color = Colors.blueAccent;
            }else if(res>=18.5 && res<24.9){
              bmi="Normal Weight"; color = Colors.green;
            }else if(res>=24.9 && res<29.9){
              bmi="Over Weight";color = Colors.amber;
            }else{ bmi="Obesity";color = Colors.red;}

///show model bottom sheet,it shows the container


            showModalBottomSheet(context: context, builder:( BuildContext context){
              return Container(
                height: 300,
                width: 500,
                color: color,
                child: Column(
                  children: [
                    Text("BMI:$res"),
                    Text("Weight Status:$bmi"),
                  ],
                ),
              );
            });
          }, child: Text("Calculate"))
        ],
      ),

    );
  }
}

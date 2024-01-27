import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  TextEditingController Height = TextEditingController();
  TextEditingController Weight = TextEditingController();
  double result = 0.0;
  var size, height, widht;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'BMI',
              style: TextStyle(fontSize: 30),
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Text(
                'HEIGHT :',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),

              Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: Height,
                    decoration: InputDecoration(
                      hintText: "ENTER HEIGHT",
                      hintStyle: TextStyle(fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              "(centimeters)",
              style: TextStyle(fontSize: 22),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Text(
                'WEIGHT :',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: Weight,
                    decoration: InputDecoration(
                      hintText: "ENTER WEIGHT",
                      hintStyle: TextStyle(fontSize: 15),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              "(kilograms)",
              style: TextStyle(fontSize: 22),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),





          ElevatedButton(
            onPressed: () {
              setState(() {
                double a = double.parse(Height.text);
                double b = double.parse(Weight.text);
                a = a / 100;
                double result = b / (a * a);
                Height.text = result.toString();


                if(result < 18.5)
                {
                  setState(() {
                    showDialog(context: context,
                      builder:(context)=>AlertDialog(
                        backgroundColor: Colors.orange.shade200,
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                              child:Text(' OK',style: TextStyle(fontSize: 28),))
                        ],
                        title: Column(
                          children: [
                            Text('YOUR BMI: ${Height.text}',style: TextStyle(fontSize: 40,),),
                            Text('UNDER WEIGHT',style: TextStyle(fontSize: 30),)
                          ],
                        ),
                      ),
                    );

                  });
                }


                else if (18.5 < result && result < 25)
                {
                  setState(() {
                    showDialog(context: context,
                      builder:(context)=>AlertDialog(
                        backgroundColor: Colors.greenAccent.shade200,
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                              child:Text(' OK',style: TextStyle(fontSize: 28),))
                        ],
                        title: Column(
                          children: [
                            Text('YOUR BMI: ${Height.text}',style: TextStyle(fontSize: 40,),),
                            Text('NORMAL WEIGHT',style: TextStyle(fontSize: 30),)
                          ],
                        ),
                      ),
                    );

                  });
                }


                else
                {
                  setState(() {
                    showDialog(context: context,
                      builder:(context)=>AlertDialog(
                        backgroundColor: Colors.red.shade300,
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                              child:Text(' OK',style: TextStyle(fontSize: 28),))
                        ],
                        title: Column(
                          children: [
                            Text('YOUR BMI: ${Height.text}',style: TextStyle(fontSize: 40, ),),
                            Text('OVER WEIGHT',style: TextStyle(fontSize: 30),)
                          ],
                        ),
                      ),
                    );
                  });
                };



              });
            },
            child: Text(
              'BMI',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(minimumSize: Size(80, 60)),
          ),


          Text(
            'YOUR BMI :',
            style: TextStyle(fontSize: 30),
          ),


          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: Center(
                child: Text(
                  Height.text,
                  style: TextStyle(fontSize: 25),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            "Under weight =<18.5\nNormal Weight =18.5 - 24.9\n"
                "Over weight =25 - 29.9",
            style: TextStyle(fontSize: 23),
          )
        ],
      ),
    );
  }
}
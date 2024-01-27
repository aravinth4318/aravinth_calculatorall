import 'package:flutter/material.dart';



class ara_bmi extends StatefulWidget {
  const ara_bmi({super.key});

  @override
  State<ara_bmi> createState() => _ara_bmiState();
}

class _ara_bmiState extends State<ara_bmi> {

  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();

  String bmi = "";
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        //backgroundColor: Colors.lightGreenAccent,
        title: Center(
          child: Text("Calculat Your Bmi",
          style: TextStyle(fontSize: 25,
              color: Colors.black),
          ),
        ),
      ),


      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          ///Weight details


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Weight :",
              style: TextStyle(fontSize: 20,
              color: Colors.black),),
              Container(
                width: MediaQuery.of(context).size.width*.6,
                child: TextFormField(
                  style: TextStyle(fontSize: 30),
                 controller: weight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                   labelText: "Enter Your Weight",
                    labelStyle: TextStyle(fontSize: 20),
                    prefix: Icon(Icons.monitor_weight_outlined),
                    //hintText: "Enter Your Weight",
                    //hintStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          weight.clear();
                        },
                        icon: Icon(Icons.close),
                      ),
                  ),
                ),
              ),
              Text("( Cm )",
                style: TextStyle(fontSize: 20,
                    color: Colors.black),),
            ],
          ),


          ///height details



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Height :",
                style: TextStyle(fontSize: 20,
                    color: Colors.black),),
              Container(
                width: MediaQuery.of(context).size.width*.6,
                child: TextFormField(
                  style: TextStyle(fontSize: 30),
                  controller: height,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Your Height",
                    labelStyle: TextStyle(fontSize: 20),
                    prefix: Icon(Icons.height),
                    //hintText: "Enter Your Height",
                    //hintStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){
                        height.clear();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              Text("( Gm )",
                style: TextStyle(fontSize: 20,
                    color: Colors.black),),
            ],
          ),



          ///ok button details


         ElevatedButton(
           onPressed: (){

             var result = double.parse(weight.text)
                 /((double.parse(height.text)
                     /100)*(double.parse(height.text)/100));
             if (result <18.5){
               bmi = "Under Weight";
               color = Colors.blueAccent;
             }
             else if (result > 18.5 && result < 24.9){
               bmi = "Normal Weight";
               color = Colors.green;
             }
             else if (result > 24.9 && result <29.9){
               bmi = "Over Weight";
               color = Colors.amber;
             }
             else { bmi = "Obseity"; color = Colors.red;}

             ///show model buttom sheet, it show the container result details

             showModalBottomSheet(
                 context: context,
                 builder: (BuildContext contet) {
               return Container(
                 height: 400,
                 width:  500,
                 color: color,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text("Result",
                     style: TextStyle(fontSize: 25),),
                     Text("Bmi : $result",
                     style: TextStyle(fontSize: 20),),
                     Text("Weight Status : $bmi",
                     style: TextStyle(fontSize: 20),),
                     ElevatedButton(
                       onPressed: (){
                         Navigator.pop(context);
                       },
                         child: Text("Ok"),
                     ),
                   ],
                 ),
               );
             }
             );


           },
           style: ElevatedButton.styleFrom(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10),
             ),
             backgroundColor: Colors.lightGreenAccent,
           ),
             child: Text("Calculat",
             style: TextStyle(
               fontSize: 25,
               color: Colors.black
             ),),
         ),




        ],
      ),
    );
  }
}

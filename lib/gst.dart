import 'package:flutter/material.dart';
class gstcalc extends StatefulWidget {
  const gstcalc({super.key});

  @override
  State<gstcalc> createState() => _gstcalcState();
}

class _gstcalcState extends State<gstcalc> {
  double actual=0;
  double calcgst=0;
  double total=0;

  final text1=TextEditingController();
  final text2=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: text1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bill Amount",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: text2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "GST Calculator",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),


                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        calcgst=(double.parse(text1.text)*double.parse(text2.text)/100);
                        total=double.parse(text1.text)+calcgst;
                        double sgst=calcgst/2;
                        double cgst=calcgst/2;



                        showDialog(context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                content: Container(
                                  height: 200,
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Text("Gst:$calcgst"),
                                      Text("Total:$total"),
                                      Text("CGST:$cgst"),
                                      Text("SGST:$sgst"),
                                    ],
                                  ),
                                ),
                              );
                            });
                      });
                    }, child: Text("Exclusive")),


                    ElevatedButton(onPressed: (){
                      calcgst=(double.parse(text1.text)*double.parse(text2.text)/(100+double.parse(text2.text)));
                      total=double.parse(text1.text)-calcgst;
                      double sgst=calcgst/2;
                      double cgst=calcgst/2;


                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          content: Container(
                            height: 200,
                            width: 200,
                            child: Column(
                              children: [
                                Text("Actual Amount:$total"),
                                Text("Total GST:$calcgst"),
                                Text("sgst:$sgst"),
                                Text("cgst:$cgst"),

                              ],
                            ),
                          ),
                        );
                      });
                    }, child: Text("Inclusive")),

                  ],
                )

              ])),
    );
  }
}
import 'package:flutter/material.dart';



class ara_gst extends StatefulWidget {
  const ara_gst({super.key});

  @override
  State<ara_gst> createState() => _ara_gstState();
}

class _ara_gstState extends State<ara_gst> {

  final TextEditingController bill = TextEditingController();
  final TextEditingController gst = TextEditingController();

  double actual = 0;
  double calgst = 0;
  double total = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      //backgroundColor: Color(0xff81da5b),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        //backgroundColor: Color(0xff81da5b),
        title: Center(
          child: Text("Calculat The Gst",
          style: TextStyle(
              color: Colors.black,
              fontSize: 25),),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ///bill amount details

          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: bill,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Bill Amount",
                labelStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.attach_money),
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.clear),
                )
              ),
            ),
          ),

          ///gst details

          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: gst,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  labelText: "Gst %",
                  labelStyle: TextStyle(fontSize: 20),
                  prefixIcon: Icon(Icons.money_off),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.clear),
                  )
              ),
            ),
          ),


          ///show the Calculat details

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ///exclusive

              ElevatedButton(
                onPressed: (){
                setState(() {
                  calgst = (double.parse(bill.text)*
                  double.parse(gst.text)/100);
                  total = double.parse(bill.text)+calgst;
                  double sgst = calgst/2;
                  double cgst = calgst/2;

                  ///show the model bottom sheet details

                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context){
                    return Container(
                      height: 400,
                      width:  500,
                      color: Colors.teal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Result",
                            style: TextStyle(fontSize: 25),),
                          Text("Gst : $calgst",
                            style: TextStyle(fontSize: 20),),
                          Text("Sgst : $sgst",
                            style: TextStyle(fontSize: 20),),
                          Text("Cgst : $cgst",
                            style: TextStyle(fontSize: 20),),
                          Text("Total : $total",
                            style: TextStyle(fontSize: 20),),
                          ElevatedButton(
                            onPressed: (){
                            Navigator.pop(context);
                          },
                              child: Text("Back",
                                style: TextStyle(fontSize: 25,color: Colors.black),)
                          ),
                        ],
                      ),
                    );
                  }
                  );

                });
              },
                child: Text("Exclusive",
                style: TextStyle(color: Colors.black,fontSize: 20),),
              ),


              ///inclusive

              ElevatedButton(
                onPressed: (){
                  calgst = (double.parse(bill.text)*
                      double.parse(gst.text)/
                      (100+double.parse(gst.text)));
                  total = double.parse(bill.text)-calgst;
                  double sgst = calgst/2;
                  double cgst = calgst/2;

                  ///show the model bottom sheet details

                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context){
                    return Container(
                      height: 400,
                      width:  500,
                      color: Colors.tealAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Result",
                          style: TextStyle(fontSize: 25),),
                          Text("Actual Amount : $total",
                          style: TextStyle(fontSize: 20),),
                          Text("Total Gst : $calgst",
                            style: TextStyle(fontSize: 20),),
                          Text("Sgst : $sgst",
                            style: TextStyle(fontSize: 20),),
                          Text("Cgst : $cgst",
                            style: TextStyle(fontSize: 20),),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Back",
                              style: TextStyle(fontSize: 25,color: Colors.black),),
                          ),
                        ],
                      ),
                    );
                  }
                  );
                },
                  child: Text("Inclusive",
                  style: (TextStyle(fontSize: 20,color: Colors.black)),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

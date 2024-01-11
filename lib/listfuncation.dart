import 'package:flutter/material.dart';


class listfunction extends StatefulWidget {
  const listfunction({super.key});

  @override
  State<listfunction> createState() => _listfunctionState();
}

class _listfunctionState extends State<listfunction> {


  final controller = TextEditingController();

  String tff = "";

  List lis = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7eb301),
      appBar: AppBar(
        backgroundColor: Color(0xff7eb301),
        title: Center(
          child: Text("List Funtion",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.black),
          ),
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ///type the value any value for in textformfield

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 30),
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    controller.clear();
                  },
                  icon: Icon(Icons.close),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),


          ///elevated button show the
          ///textformfield value inside of the container


          ElevatedButton(
            onPressed: (){

              setState(() {
                tff = controller.text;
                lis.add(tff);
                controller.text = "";

              }
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff000000),
              shape: CircleBorder(),
              padding: EdgeInsets.all(30),
            ),
            child: Text("Click",
              style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),



          ///container in side show the only textformfield value

          Container(
            height: 300,
            width:  400,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black
                )
            ),
            child: ListView.builder(
                itemCount: lis.length,
                itemBuilder: (BuildContext context, index){
                  return
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(lis[index].toString(),
                          style: TextStyle(fontSize: 30,),
                        ),

                      ],
                    );
                }
            ),
          ),


          /// this button clear the container value only


          ElevatedButton(
              onPressed: (){

                setState(() {
                  lis.clear();

                });
              },
              child: Text("Clear",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30),
              )
          ),
        ],
      ),
    );
  }
}

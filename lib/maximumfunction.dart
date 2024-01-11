import 'package:flutter/material.dart';



class maximumfunction extends StatefulWidget {
  const maximumfunction({super.key});

  @override
  State<maximumfunction> createState() => _maximumfunctionState();
}

class _maximumfunctionState extends State<maximumfunction> {

final controller = TextEditingController();

String textformfield = "";

List addlist = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,

      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text("Maximum Function",
          style: TextStyle(
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
              controller: controller,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10,),
                    borderSide: BorderSide(width: 2,
                        color: Colors.black),
                ),
               suffixIcon: IconButton(
                 onPressed: (){
                   controller.clear();
                 },
                 icon: Icon(Icons.close),
               )
              ),

            ),
          ),



          ///elevated button show the
          ///textformfield value inside of the container


          ElevatedButton(
            onPressed: (){

              setState(() {
                textformfield = controller.text;
                controller.text = "";
                addlist.add(textformfield);
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                backgroundColor: Colors.white
            ),
              child: Text("Enter",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25),
              ),
          ),
          
          
          ///container in side show the only textformfield value
          
          
          Container(
            height: 300,
            width:  400,

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: ListView.builder(
              itemCount: addlist.length,
                itemBuilder: (
                    BuildContext context, index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(addlist[index].toString(),
                      style: TextStyle(fontSize: 25,
                      color: Colors.black),
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
               addlist.clear();

              });
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.white
            ),
            child: Text("Clear",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ///maxmium value button function

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    addlist.sort();
                    addlist.sort((a,b) => int.parse(a).compareTo(int.parse(b)));
                  });
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          width:  400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Small: ${addlist.first}",
                              style: TextStyle(
                                fontSize: 30
                              ),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                child: Text("Ok",
                                  style: TextStyle(color: Colors.green,fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Text("Maximum",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),

              ///minimum  value button function

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    addlist.sort();
                    addlist.sort((a,b) => int.parse(a).compareTo(int.parse(b)));
                  });
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          width:  400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("High: ${addlist.last}",
                                style: TextStyle(
                                    fontSize: 30
                                ),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    backgroundColor: Colors.white,
                                ),
                                child: Text("Ok",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        );
                  });
                },

                child: Text("Minimum",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),
            ],
          ),

        ],
      ),

    );
  }
}




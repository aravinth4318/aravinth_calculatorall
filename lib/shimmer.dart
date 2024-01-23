import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class shimm extends StatefulWidget {
  const shimm({super.key});

  @override
  State<shimm> createState() => _shimmState();
}

class _shimmState extends State<shimm> {

  bool isLoading = true;
  void toggleLoading() {
    Future.delayed( const Duration(milliseconds: 3000),() {
      setState(() {
        isLoading = !isLoading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
 Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Loading'),
      ),
      // body: Center(
      //   child: isLoading ? _buildShimmer() : _buildContent(),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     toggleLoading();
      //   },
      //   child: Icon(Icons.refresh),
      // ),
   body: Column(
     children: [
       SizedBox(height: 50,),
       Shimmer.fromColors(

        period:Duration(seconds: 4) ,
        // direction: ShimmerDirection.ttb,
         baseColor: Colors.redAccent,
         highlightColor: Colors.lightGreenAccent,

         child: Center(
           child: Container(
             height: 500,
             width: 300,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage("assets/ck5.jpg"))
             ),
           ),
         ),
       )
       
     ],
   ),
   
   
   
   
    );
  }

  // Widget _buildShimmer() {
  //   return Shimmer.fromColors(
  //     baseColor: Colors.grey[300]!,
  //     highlightColor: Colors.grey[100]!,
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           width: 200.0,
  //           height: 20.0,
  //           color: Colors.white,
  //         ),
  //         SizedBox(height: 10.0),
  //         Container(
  //           width: 150.0,
  //           height: 20.0,
  //           color: Colors.white,
  //         ),
  //         SizedBox(height: 10.0),
  //         Container(
  //           width: 180.0,
  //           height: 20.0,
  //           color: Colors.white,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildContent() {
  //   // Replace this with your actual content
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text(
  //         'Your Content Here',
  //         style: TextStyle(fontSize: 20.0),
  //       ),
  //       SizedBox(height: 10.0),
  //       Text(
  //         'More Content...',
  //         style: TextStyle(fontSize: 16.0),
  //       ),
  //     ],
  //   );
  // }
}

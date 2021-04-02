import 'package:flutter/material.dart';
import 'package:flutter_firebase_tpg/model/data.dart';


class DisplayPage extends StatefulWidget {
  // final String  title;
  // final String desc;
  // final String imgURL;
  //const DisplayPage({Key key, this.title, this.desc, this.imgURL}) : super(key: key);
    // final List<Data> listdata;
  final Data listData;
  DisplayPage({ this.listData});

    @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text(widget.listData.title + " Recipe")),
        // actions: [
        //   //Center(child: Text(widget.listData.title + " Recipe")),
        // // Container(
        // //   decoration: BoxDecoration(
        // //     shape: BoxShape.circle,
        // //   ),
        // //   child: Padding(
        // //       padding: const EdgeInsets.only(top: 10.0, right: 12),
        // //       child: InkWell(child: Icon(Icons.share,color: Colors.black,size: 15,),
        // //         onTap:() {
        // //           final RenderBox box = context.findRenderObject();
        // //               Share.share( );
        // //               sharePositionOrigin:
        // //               box.localToGlobal(Offset.zero) &
        // //               box.size);
        // //         },
        // //       )
        // //   ),
        // // ),
        //
        // ],


    //
    ),
      body:
            SingleChildScrollView(
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: 220,
                        width: 360,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Hero(
                          tag: widget.listData.title,
                          child: Image.network(
                            widget.listData.imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 30,),
                Text("Method",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 12,right: 12),
                  child: Container(

                      decoration: BoxDecoration(
                          color:Color(0xFFDDFFE7),
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight,
                            colors: <Color>[Color(0xFF97f6df), Color(0xFFddfcf4)],
                          ),
                          borderRadius: BorderRadius.circular(11),
                          boxShadow: [
                            BoxShadow(color: Colors.teal, offset: Offset(5.0, 5.0))
                          ]),
                      // decoration: new BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Color(0xFFDDFFE7),
                      //       blurRadius: 25.0, // soften the shadow
                      //       spreadRadius: 5.0, //extend the shadow
                      //       offset: Offset(
                      //         5.0, // Move to right 10  horizontally
                      //         5.0, // Move to bottom 10 Vertically
                      //       ),
                      //     )
                      //   ],
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.listData.desc),
                      )),
                ),
              ],
          ),
            ),
    );
  }
}


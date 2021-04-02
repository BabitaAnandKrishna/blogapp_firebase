import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tpg/Screens/Display.dart';
import 'package:flutter_firebase_tpg/model/data.dart';
import 'package:flutter_firebase_tpg/model/recipeData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class blogProcedure extends StatefulWidget {
  final recipeData recipe;

  blogProcedure({
    this.recipe,
  });

  @override
  _blogProcedureState createState() => _blogProcedureState();
}

class _blogProcedureState extends State<blogProcedure> {
  // bool isSwitched = true;

  var ref = FirebaseFirestore.instance.collection("BlogAppProj");
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  Map<String, dynamic> addToBlog;
  addData() {
    addToBlog = {
      'title': titleController.text,
      'description': descriptionController.text,
      'Image': imageController.text,
    };
    ref.add(addToBlog).whenComplete(() => Navigator.pop(context));
    titleController.text = "";
    descriptionController.text = "";
    imageController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   shape: BoxShape.rectangle,
          //   color: Color(0xFF1D741B),
          //   borderRadius: BorderRadius.circular(25),
          // ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                ),
                child: Text(
                  widget.recipe.Name + " Blogs",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
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
                        color: Color(0xFF8BCD50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Hero(
                        tag: widget.recipe.Name,
                        child: Image.network(
                          widget.recipe.ImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),

              // Center(
              //   child: Switch(
              //     value: isSwitched,
              //     onChanged: (value) {
              //       setState(() {
              //         isSwitched = value;
              //         print(isSwitched);
              //       });
              //     },
              //     activeTrackColor: Colors.yellow,
              //     activeColor: Colors.orangeAccent,
              //   ),
              // )
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      width: 150,
                      decoration: BoxDecoration(
                          color:  Color(0xFF0a4076),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(27)),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                child: Container(
                                  height: 300,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDDFFE7),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: TextFormField(
                                          controller: titleController,
                                          decoration: InputDecoration(
                                              labelText: "Tiltle",
                                              hintText: "Entre your Title"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: TextFormField(
                                          controller: descriptionController,
                                          decoration: InputDecoration(
                                              labelText: "Description",
                                              hintText:
                                                  "Entre your Description"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: TextFormField(
                                          controller: imageController,
                                          decoration: InputDecoration(
                                              labelText: "ImageUrl",
                                              hintText: "Entre your ImageUrl"),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 40,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF167D7F),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: TextButton(
                                              child: Text("Submit",style: TextStyle(color: Colors.white),),
                                              onPressed: () {
                                                addData();
                                              },
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            // addData();
                          },
                          child: Text(
                            "Add New Blog",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              StreamBuilder(

                stream:  ref.snapshots(), //ref.where("Recipe",isEqualTo: widget.recipe.Name).snapshots(), //
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    print(widget.recipe.Name);
                    List<Data> dataList = snapshot.data.docs
                        .map((e) => Data.fromJson(e.data()))
                        .toList();
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dataList.length, //snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DisplayPage(
                                          listData: dataList[index])));
                              // Navigator.push(context,MaterialPageRoute(builder: (_) => DisplayPage(
                              //   listData: dataList[index],
                              //    title: titleController.text = dataList[index].title,
                              //     desc : descriptionController.text = dataList[index].desc,
                              // imgURL :imageController.text = dataList[index].imgUrl,
                              // )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  height: 110,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFddfced),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Hero(
                                              tag: dataList[index].title,
                                              child: Image.network(
                                                dataList[index].imgUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            // snapshot.data.docs[index].data()['Image']),
                                          ),
                                        ),
                                      ),

                                      // Container(
                                      //   child: Padding(
                                      //       padding: const EdgeInsets.only(top: 10.0, left: 300),
                                      //       child: InkWell(child: Icon(Icons.share,color: Colors.black,size: 15,),
                                      //         onTap:() {
                                      //           final RenderBox box = context.findRenderObject();
                                      //
                                      //           Share.share(dataList[index].title,subject:dataList[index].toString() ,
                                      //               sharePositionOrigin:
                                      //               box.localToGlobal(Offset.zero) &
                                      //               box.size);
                                      //         },
                                      //       )
                                      //   ),
                                      // ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [

                                            InkWell(
                                              onTap: () {
                                                snapshot.data.docs[index].reference.delete();
                                                //dataList.removeAt(index);
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 0),
                                                child: Icon(
                                                  Icons.delete_forever_sharp,
                                                  size: 18,color:Colors.black,
                                                ),
                                              ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 120,
                                                  right: 8,
                                                  bottom: 0,
                                              top:2),
                                              child:
                                                  Text(
                                                    dataList[index].title,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),

                                                  // InkWell(
                                                  //     onTap: (){ Icon(Icons.share,color: Colors.black,size: 15,);}),

                                                  // IconButton(
                                                  //     icon: const Icon(Icons.share,color: Colors.black,size: 15,),
                                                  //   onPressed:(){
                                                  //     SimpleShare.share(uri: dataList[index].toString());
                                                  //     // final  RenderBox box = context.findRenderObject();
                                                  //     // Share.shareFile(File()
                                                  //     // ,sharePositionOrigin:
                                                  //     // box.localToGlobal(Offset.zero) &
                                                  //     // box.size);
                                                  //
                                                  //   },
                                                  //    )


                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 120,
                                                  top: 8,
                                                  right: 8,
                                                  bottom:7),
                                              child: Text(
                                                dataList[index].desc,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                softWrap: false,
                                              ),
                                            ),
                                          ]),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                             left: 280),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    titleController.text =
                                                        dataList[index].title;
                                                    descriptionController.text =
                                                        dataList[index].desc;
                                                    imageController.text =
                                                        dataList[index].imgUrl;
                                                    // titleController.text = snapshot.data.docs[index].data()['title'];
                                                    // descriptionController.text = snapshot.data.docs[index].data()['description'];
                                                    // imageController.text = snapshot.data.docs[index].data()['Image'];

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          Dialog(
                                                           child: Container(
                                                            height: 300,
                                                            width: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(0xFFDDFFE7),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  //top: 8,
                                                                  left: 8,
                                                                  right: 8,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      titleController,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Tiltle",
                                                                      hintText:
                                                                          "Entre your Title"),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 8,
                                                                  left: 8,
                                                                  right: 8,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      descriptionController,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "Description",
                                                                      hintText:
                                                                          "Entre your Description"),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 8,
                                                                  left: 8,
                                                                  right: 8,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      imageController,
                                                                  decoration: InputDecoration(
                                                                      labelText:
                                                                          "ImageUrl",
                                                                      hintText:
                                                                          "Entre your ImageUrl"),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            40,
                                                                        width:
                                                                            200,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFF167D7F),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        ),
                                                                        child:
                                                                            TextButton(
                                                                          child:
                                                                              Text("Update",style: TextStyle(color: Colors.white),),
                                                                          onPressed:
                                                                              () {
                                                                              snapshot.data.docs[index].reference.update({
                                                                              'title': titleController.text,
                                                                              'description': descriptionController.text,
                                                                              'Image': imageController.text,
                                                                            }).whenComplete(() =>
                                                                                Navigator.pop(context));
                                                                            titleController.text =
                                                                                "";
                                                                            descriptionController.text =
                                                                                "";
                                                                            imageController.text =
                                                                                "";
                                                                          },
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),


                                            ]),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else
                    return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

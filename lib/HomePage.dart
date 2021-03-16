import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Display.dart';

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  var ref = Firestore.instance.collection("BlogAppProj");

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Map<String, dynamic>addToBlog;
  addData(){
    addToBlog={
      'title': titleController.text,
      'description':descriptionController.text,
    };
    ref.add(addToBlog).whenComplete(() => Navigator.pop(context));
    titleController.text="";
    descriptionController.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Blog'),
      ),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData) {
            return Column(

              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>DisplayPage(snapshot.data.documents[index].data['title'],
                              snapshot.data.documents[index].data['description']
                          )));
                        },

                        child: Card(
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit),
                                onPressed: (){
                                    titleController.text = snapshot.data.documents[index].data['title'];
                                    descriptionController.text = snapshot.data.documents[index].data['description'];
                                  showDialog(context: context, builder: (context)=> Dialog(
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      color: Colors.blue,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: titleController,
                                              decoration: InputDecoration(
                                                  labelText: "Tiltle",
                                                  hintText: "Entre your Title"
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: descriptionController,
                                              decoration: InputDecoration(
                                                  labelText: "Description",
                                                  hintText: "Entre your Description"
                                              ),
                                            ),
                                          ),
                                          Container(
                                              height: 40,
                                              width: 200,
                                              color: Colors.red,
                                              child: TextButton(
                                                child: Text("Update"),
                                                onPressed: (){
                                                  snapshot.data.documents[index].reference.updateData({
                                                    'title': titleController.text,
                                                    'description':descriptionController.text,
                                                  });
                                                  // addData();
                                                },
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                                },
                              ),
                              Text(snapshot.data.documents[index].data['title']),
                              Text(snapshot.data.documents[index].data['description']),
                              InkWell(
                                onTap: (){
                                  snapshot.data.documents[index].reference.delete();
                                },
                                  child:Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    }
                ),
                Container(
                  color: Colors.red,
                  height: 40,
                  width: 300,
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context)=> Dialog(
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.blue,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    labelText: "Tiltle",
                                    hintText: "Entre your Title"
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                      labelText: "Description",
                                      hintText: "Entre your Description"
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                  width: 200,
                                  color: Colors.red,
                                  child: TextButton(
                                    child: Text("Submit"),
                                    onPressed: (){
                                      addData();
                                    },
                                  )
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                    child: Text('Add'),
                  ),
                )
              ],
            );

          }else{
            return Center(child: CircularProgressIndicator());
          }
         },
        ),
      );
  }
}
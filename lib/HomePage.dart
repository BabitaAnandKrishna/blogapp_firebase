// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'model/Display.dart';
//
// class BlogApp extends StatefulWidget {
//   @override
//   _BlogAppState createState() => _BlogAppState();
// }
//
// class _BlogAppState extends State<BlogApp> {
//   var ref = Firestore.instance.collection("BlogAppProj");
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//
//   Map<String, dynamic>addToBlog;
//   addData(){
//     addToBlog={
//       'title': titleController.text,
//       'description':descriptionController.text,
//     };
//     ref.add(addToBlog).whenComplete(() => Navigator.pop(context));
//     titleController.text="";
//     descriptionController.text="";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Blog'),
//       ),
//       body: StreamBuilder(
//         stream: ref.snapshots(),
//         builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
//           if(snapshot.hasData) {
//             return Column(
//
//               children: [
//                 ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (_)=>DisplayPage(snapshot.data.documents[index].data['title'],
//                               snapshot.data.documents[index].data['description']
//                           )));
//                         },
//
//                         child: Card(
//                           child: Row(
//                             children: [
//                               IconButton(
//                                   icon: Icon(Icons.edit),
//                                 onPressed: (){
//                                     titleController.text = snapshot.data.documents[index].data['title'];
//                                     descriptionController.text = snapshot.data.documents[index].data['description'];
//                                   showDialog(context: context, builder: (context)=> Dialog(
//                                     child: Container(
//                                       height: 200,
//                                       width: 200,
//                                       color: Colors.blue,
//                                       child: Column(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: TextFormField(
//                                               controller: titleController,
//                                               decoration: InputDecoration(
//                                                   labelText: "Tiltle",
//                                                   hintText: "Entre your Title"
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: TextFormField(
//                                               controller: descriptionController,
//                                               decoration: InputDecoration(
//                                                   labelText: "Description",
//                                                   hintText: "Entre your Description"
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                               height: 40,
//                                               width: 200,
//                                               color: Colors.red,
//                                               child: TextButton(
//                                                 child: Text("Update"),
//                                                 onPressed: (){
//                                                   snapshot.data.documents[index].reference.updateData({
//                                                     'title': titleController.text,
//                                                     'description':descriptionController.text,
//                                                   });
//                                                   // addData();
//                                                 },
//                                               )
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ));
//                                 },
//                               ),
//                               Text(snapshot.data.documents[index].data['title']),
//                               Text(snapshot.data.documents[index].data['description']),
//                               InkWell(
//                                 onTap: (){
//                                   snapshot.data.documents[index].reference.delete();
//                                 },
//                                   child:Icon(Icons.delete)),
//                             ],
//                           ),
//                         ),
//                       );
//                     }
//                 ),
//                 Container(
//                   color: Colors.red,
//                   height: 40,
//                   width: 300,
//                   child: MaterialButton(
//                     onPressed: (){
//                       showDialog(context: context, builder: (context)=> Dialog(
//                         child: Container(
//                           height: 200,
//                           width: 200,
//                           color: Colors.blue,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: TextFormField(
//                                   controller: titleController,
//                                   decoration: InputDecoration(
//                                     labelText: "Tiltle",
//                                     hintText: "Entre your Title"
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: TextFormField(
//                                   controller: descriptionController,
//                                   decoration: InputDecoration(
//                                       labelText: "Description",
//                                       hintText: "Entre your Description"
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: 40,
//                                   width: 200,
//                                   color: Colors.red,
//                                   child: TextButton(
//                                     child: Text("Submit"),
//                                     onPressed: (){
//                                       addData();
//                                     },
//                                   )
//                               ),
//                             ],
//                           ),
//                         ),
//                       ));
//                     },
//                     child: Text('Add'),
//                   ),
//                 )
//               ],
//             );
//
//           }else{
//             return Center(child: CircularProgressIndicator());
//           }
//          },
//         ),
//       );
//   }
// }
// Scaffold(
// body: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// ZStack([
// VxBox(
// child: Icon(
// Icons.local_airport,
// color: Colors.white,
// ))
// .width(60.0)
// .height(60.0)
// .roundedLg
//     .green600
//     .make()
// .pOnly(top: 32, left: 24),
// VxBox(
// child: Icon(
// Icons.location_on,
// color: Colors.white,
// ))
// .width(60.0)
// .height(60.0)
// .roundedLg
//     .orange600
//     .make()
// .pOnly(left: 50),
// VxBox(
// child: Icon(
// Icons.home,
// color: Colors.white,
// ))
// .width(60.0)
// .height(60.0)
// .roundedLg
//     .pink600
//     .make()
// .pOnly(right: 50),
// VxBox(
// child: Icon(
// Icons.home,
// color: Colors.white,
// ))
// .width(35.0)
// .height(35.0)
// .roundedLg
//     .blue700
//     .make()
// .pOnly(left: 38, top: 26),
// ]),
// "YOUR APP NAME"
//     .text
//     .blue700
//     .bold
//     .italic
//     .size(20)
// .make()
//     .pOnly(top: 35),
// GestureDetector(
// onTap: () {
// print("Sign in Email Clicked");
// },
// child: 'Sign-In with Email'
// .text
//     .xl
//     .semiBold
//     .gray700
//     .makeCentered()
// .card
//     .rounded
//     .gray400
//     .make()
// .wh(MediaQuery.of(context).size.width, 65)
// .pOnly(left: 20, right: 20, top: 20),
// ),
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_tpg/model/recipeData.dart';
import 'file:///C:/Users/anand/AndroidStudioProjects/TPG/flutter_firebase_tpg/lib/Screens/BlogPage.dart';


class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // actions: <Widget>[
        // ListTile(
        //   trailing: CircleAvatar(
        //     radius: 35,
        //     backgroundImage: NetworkImage(
        //         "https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg"),
        //   ),
        //   title: Text("Good Morning"),
        // )
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg"),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning\n",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Text(
                "\nBabita",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF167D7F)),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 220,
                    width: 330,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xFF29A0B1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.network(
                        "https://images.creativemarket.com/0.1.0/ps/4425285/1820/1213/m1/fpnw/wm1/vik7fgnk6iwb50vfgssyyfa7poutctycxhyvnqgbzrjtqwhesbczznkbqctjidpx-.jpg?1525851628&s=e87b83a22fea6d9766b62ee6af9cc721"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 50.0),
                  child: Container(
                    height: 90,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            Text(
                              "Top Blogs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.redAccent,
                              size: 25,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 230,
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: recipeDataList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => blogProcedure(
                                  recipe: recipeDataList[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                                height: 180,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFF98D7C2),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Hero(
                                  tag: recipeDataList[index].Name,
                                  child: Image.network(
                                      recipeDataList[index].ImageUrl),
                                ))),
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                recipeDataList[index].Name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 0,right: 280

            ),
            child: Text(
              "Featured",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 10),
                    child: Container(
                      height: 220,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(

                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            "https://c0.wallpaperflare.com/preview/639/306/330/aerial-background-blog-cafe.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 5),
                    child: Icon(
                      Icons.bookmarks_outlined,
                      color: Color(0xFF2F5233),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:195.0,top:50),
                child: Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15),
                    child: Text(
                      "Recipe" + "\nBlog",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
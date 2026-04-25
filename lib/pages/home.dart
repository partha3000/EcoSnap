import 'package:ecosnap/pages/upload_item.dart';
import 'package:ecosnap/services/shared_perf.dart';
import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? id;

  // ✅ CATEGORY LIST
  List<Map<String, String>> categories = [
    {"name": "Plastic", "image": "images/plastic.png"},
    {"name": "Paper", "image": "images/paper.png"},
    {"name": "Glass", "image": "images/glass.png"},
    {"name": "Battery", "image": "images/battery.png"},
    {"name": "Metal", "image": "images/metal.png"},
  ];

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    id = await SharedpreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: id == null
          ? Center(child: CircularProgressIndicator()) // ✅ loading fix
          : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Hello,",
                        style:
                        AppWidget.healinetextstyle(25.0)),
                  ),
                  Text("Akash",
                      style:
                      AppWidget.greentextstyle(25.0)),
                  Spacer(),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 15.0),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(20),
                      child: Image.asset(
                        "images/user.png",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 5),

              // IMAGE
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "images/recycle_home.png",
                    height: 300,
                  ),
                ),
              ),

              // CATEGORY TITLE
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0),
                child: Text("Categories",
                    style:
                    AppWidget.healinetextstyle(25.0)),
              ),

              SizedBox(height: 20),

              // 🔥 UPDATED CATEGORY SECTION
              Container(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    var item = categories[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UploadItem(
                                    category:
                                    item["name"]!,
                                    id: id!,
                                  ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              padding:
                              EdgeInsets.all(8.0),
                              decoration:
                              BoxDecoration(
                                color:
                                Color(0xFFececf8),
                                borderRadius:
                                BorderRadius
                                    .circular(20),
                                border: Border.all(
                                    color:
                                    Colors.black45,
                                    width: 2.0),
                              ),
                              child: Image.asset(
                                item["image"]!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item["name"]!,
                              style: AppWidget
                                  .normaltextstyle(20),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // PENDING REQUEST (same as your code)
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0),
                child: Text("Pending Request",
                    style:
                    AppWidget.healinetextstyle(25.0)),
              ),

              SizedBox(height: 15),

              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.black45, width: 2),
                  borderRadius:
                  BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on,
                            color: Colors.green),
                        SizedBox(width: 10),
                        Text("Main market, Dhaka",
                            style: AppWidget
                                .normaltextstyle(15)),
                      ],
                    ),
                    Divider(),
                    Image.asset("images/chips.png",
                        height: 100),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Icon(Icons.layers,
                            color: Colors.green),
                        SizedBox(width: 10),
                        Text("5",
                            style: AppWidget
                                .normaltextstyle(20)),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
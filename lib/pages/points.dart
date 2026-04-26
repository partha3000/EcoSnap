import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosnap/services/database.dart';
import 'package:ecosnap/services/shared_perf.dart';
import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  String? id, mypoints, name;

  getthesharedpref() async {
    id = await SharedpreferenceHelper().getUserId();
    name = await SharedpreferenceHelper().getUserName();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    mypoints = await getUserPoints(id!);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ontheload();
  }

  TextEditingController pointscontroller = new TextEditingController();
  TextEditingController upicontroller = new TextEditingController();

  Future<String?> getUserPoints(String docId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(docId)
          .get();

      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;
        var points = data['Points'];
        return points.toString();
      } else {
        return 'No document';
      }
    } catch (e) {
      print('Error: $e');
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mypoints == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Points Page",
                      style: AppWidget.healinetextstyle(25.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 235, 195),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30.0),
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Material(
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "images/coin.png",
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 20.0),
                                    Column(
                                      children: [
                                        Text(
                                          "Points Earned",
                                          style: AppWidget.normaltextstyle(20),
                                        ),
                                        Text(
                                          mypoints.toString(),
                                          style: AppWidget.greentextstyle(30),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          GestureDetector(
                            onTap: () {
                              openBox();
                            },
                            child: Material(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Center(
                                  child: Text(
                                    "Reedem Points",
                                    style: AppWidget.whitetextstyle(23.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10.0),
                                  Text(
                                    "Last Transactions",
                                    style: AppWidget.normaltextstyle(20.0),
                                  ),
                                  SizedBox(height: 20.0,),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(left: 30, right: 30),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 233, 233, 249), borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.black,borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "04\nApr",
                                            textAlign: TextAlign.center,
                                            style: AppWidget.whitetextstyle(25),
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          children: [
                                            Text("Reedem Points", style: AppWidget.normaltextstyle(20.0),),
                                            Text("0", style: AppWidget.greentextstyle(26.0),)
                                          ],
                                        ),
                                        SizedBox(width: 40.0,),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(color: Color.fromARGB(48, 241, 77, 66), borderRadius: BorderRadius.circular(10)),
                                          child: Text("Pending", style: TextStyle(color: Colors.red,fontSize: 18.0, fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future openBox() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel),
                ),
                SizedBox(width: 30.0),
                Text("Reedem Points", style: AppWidget.greentextstyle(20.0)),
              ],
            ),
            SizedBox(height: 20.0),
            Text("Add Points", style: AppWidget.normaltextstyle(20.0)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: pointscontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Points",
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: upicontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter UPI",
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () async {
                if (pointscontroller.text != "" &&
                    upicontroller.text != "" &&
                    int.parse(mypoints!) > int.parse(pointscontroller.text)) {
                  DateTime now = DateTime.now();
                  String formattedDate = DateFormat('d MMM').format(now);

                  int updatedpoints =
                      int.parse(mypoints!) - int.parse(pointscontroller.text);
                  await DatabaseMethods().updateUserPoints(
                    id!,
                    updatedpoints.toString(),
                  );
                  Map<String, dynamic> userReedemMap = {
                    "Name": name,
                    "Points": pointscontroller.text,
                    "UPI": upicontroller.text,
                    "Status": "Pending",
                    "Date": formattedDate,
                  };
                  String reedemid = randomAlphaNumeric(10);
                  await DatabaseMethods().addUserReedemPoints(
                    userReedemMap,
                    id!,
                    reedemid,
                  );
                  await DatabaseMethods().addAdminReedemRequests(
                    userReedemMap,
                    reedemid,
                  );
                  mypoints = await getUserPoints(id!);
                  setState(() {});
                  Navigator.pop(context);
                }
              },
              child: Center(
                child: Container(
                  width: 100,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text("Add", style: AppWidget.whitetextstyle(20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

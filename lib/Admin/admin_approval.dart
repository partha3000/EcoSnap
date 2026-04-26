import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosnap/pages/home.dart';
import 'package:ecosnap/services/database.dart';
import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';

class AdminApproval extends StatefulWidget {
  const AdminApproval({super.key});

  @override
  State<AdminApproval> createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  Stream? approvalStream;

  getontheload() async {
    approvalStream = await DatabaseMethods().getAdminApproval();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Future<String?> getUserPoints(String docId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(docId)
          .get();

      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;
        var points = data ['Points'];
        return points.toString();
      } else {
        return 'No document';
      }
    } catch (e) {
      print('Error: $e');
      return 'Error';
    }
  }

  Widget allApprovals() {
    return StreamBuilder(
      stream: approvalStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Material(
                      elevation: 2.0,
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
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                "images/cola.png",
                                height: 180,
                                width: 120,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 20.0),
                                    Icon(
                                      Icons.person,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      ds["Name"],
                                      style: AppWidget.normaltextstyle(20.0),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0, height: 5.0),
                                Row(
                                  children: [
                                    SizedBox(width: 20.0),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      ds["Address"],
                                      style: AppWidget.normaltextstyle(20.0),
                                    ),
                                  ],
                                ),

                                SizedBox(width: 20.0, height: 5.0),
                                Row(
                                  children: [
                                    SizedBox(width: 20.0),
                                    Icon(
                                      Icons.inventory,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      ds["Quantity"],
                                      style: AppWidget.normaltextstyle(20.0),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                GestureDetector(
                                  onTap: () async {
                                    String? userpoints = await getUserPoints(ds["UserId"]);
                                    int updatepoints = int.parse(userpoints!)+100;
                                    await DatabaseMethods().updateUserPoints(ds["UserId"], updatepoints.toString());
                                    await DatabaseMethods().updateAdminRequest(ds.id,);
                                    await DatabaseMethods().updateUserRequest(ds["UserId"], ds.id,);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 200,
                                    margin: EdgeInsets.only(left: 80.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Approval",
                                        style: AppWidget.whitetextstyle(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 35.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(60),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width / 5.0),
                  Text(
                    "Admin Approval",
                    style: AppWidget.healinetextstyle(25.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xffd6d6f4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: allApprovals(),
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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosnap/services/database.dart';
import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';

class AdminApproval extends StatefulWidget {
  const AdminApproval({super.key});

  @override
  State<AdminApproval> createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  Stream<QuerySnapshot>? approvalStream;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    approvalStream = await DatabaseMethods().getAdminApproval();
    setState(() {});
  }

  Widget allApprovals() {
    return StreamBuilder<QuerySnapshot>(
      stream: approvalStream,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No Requests Found"));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {

            DocumentSnapshot ds = snapshot.data!.docs[index];

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          "images/cola.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(width: 20),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                Icon(Icons.person, color: Colors.green),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    ds["Name"]?.toString() ?? "No Name",
                                    style: AppWidget.normaltextstyle(18),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.green),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    ds["Address"]?.toString() ?? "No Address",
                                    style: AppWidget.normaltextstyle(18),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.inventory, color: Colors.green),
                                SizedBox(width: 5),
                                Text(
                                  ds["Quantity"]?.toString() ?? "0",
                                  style: AppWidget.normaltextstyle(18),
                                ),
                              ],
                            ),

                            SizedBox(height: 5.0),
                            GestureDetector(
                              onTap: ()async {
                                await DatabaseMethods().updateAdminRequest( ds.id);
                                await DatabaseMethods().updateUserRequest("UserID", ds.id);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                margin: EdgeInsets.only(left: 120),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "Approval",
                                    style: AppWidget.whitetextstyle(18),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [

                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Spacer(),
                  Text(
                    "Admin Approval",
                    style: AppWidget.healinetextstyle(22),
                  ),

                  Spacer(),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE9E9F9),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: allApprovals(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
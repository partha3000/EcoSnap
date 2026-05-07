import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';

class AdminReedem extends StatefulWidget {
  const AdminReedem({super.key});

  @override
  State<AdminReedem> createState() => _AdminReedemState();
}

class _AdminReedemState extends State<AdminReedem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 35.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(60),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(60),
                      onTap: () {
                        Navigator.pop(context);
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
                    "Admin Reedem",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),

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
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              "22\n Mar",
                              textAlign: TextAlign.center,
                              style: AppWidget.whitetextstyle(22.0),
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person, color: Colors.green, size: 25.0,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "Name the User", style: AppWidget.normaltextstyle(20.0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.point_of_sale, color: Colors.green, size: 25.0,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "Points Reedem: 10", style: AppWidget.normaltextstyle(20.0),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.point_of_sale, color: Colors.green, size: 25.0,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "UPI ID: apaxx@ff", style: AppWidget.normaltextstyle(20.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
                                child: Center(child: Text("Approval", style: AppWidget.whitetextstyle(20.0),)),
                              )
                            ],
                          ),
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
    );
  }
}

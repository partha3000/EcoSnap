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
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text(
                              "22\n Mar",
                              textAlign: TextAlign.center,
                              style: AppWidget.whitetextstyle(22.0),
                            ),
                          ),
                          Column(children: [Row(children: [
                            Icon(Icons.person, color: Colors.green,size: 25.0,),
                            SizedBox(width: 10.0,),
                            Text("Name the User", style: AppWidget.normaltextstyle(20.0),)
                          ])]),
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

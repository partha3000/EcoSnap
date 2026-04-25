import 'package:ecosnap/pages/login.dart';
import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(child: Column(
          children: [
            SizedBox(height:40.0,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset("images/original.jpg"),
            ),
            SizedBox(height:40.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text("Recycle Your Waste Products !", style: AppWidget.healinetextstyle(30.0),),
            ),
            SizedBox(height:25.0,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Easily collect household waste and generate less waste", style: AppWidget.normaltextstyle(15.0),),
            ),
            SizedBox(height: 50.0,),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.5,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Get Started", style: AppWidget.whitetextstyle(25.0),)),
                ),
              ),
            )
          ],
        ),),
      ),
    );
  }
}

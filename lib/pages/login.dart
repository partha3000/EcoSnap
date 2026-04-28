import 'package:ecosnap/services/auth.dart';
import 'package:ecosnap/services/widget_support.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Center(child: Padding(
                    padding: const EdgeInsets.only(top:50.0),
                    child: Image.asset("images/recycle_in.png",height: 350, width: 400, fit: BoxFit.cover,),
                  )),
              SizedBox(height: 15.0,),
              Image.asset("images/recycling.png", height: 60.0, width: 60.0, fit: BoxFit.cover,),
              SizedBox(height: 15.0,),
              Text("Reduce. Reuse. Recycle.", style: AppWidget.healinetextstyle(15.0),),
              Text("Repeat!", style: AppWidget.greentextstyle(25.0),),
              SizedBox(height: 20.0,),
              Text("Every item you recycle\n makes a difference!", textAlign: TextAlign.center, style: AppWidget.healinetextstyle(13.0),),
              Text("Get Started!", style: AppWidget.greentextstyle(24.0),),
              SizedBox(height: 35.0,),
              GestureDetector(
                onTap: (){
                    AuthMethods().signInWithGoogle(context);
                },
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Material(
                      elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 60,
                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(60)),
                              child: Image.asset("images/google.png", height: 35, width: 35, fit: BoxFit.cover,),),
                            SizedBox(width: 15.0,),
                            Text("Sign in with Google", style: AppWidget.whitetextstyle(20.0),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 50.0,),
            ],
          ),
        ),
      ),
    );
  }
}

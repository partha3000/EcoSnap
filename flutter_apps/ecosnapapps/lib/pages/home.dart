
import 'package:ecosnapapps/services/widget_support.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Hello,", style: AppWidget.healinetextstyle(25.0),),
                    ),
                    Text("Akash", style: AppWidget.greentextstyle(25.0),),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("images/user.png", height: 60,width: 60, fit: BoxFit.cover,)),
                    )
                  ],
                ),
              ),
              SizedBox(height:5, width: 10,),
              Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/home.png",height: 250, width: 400,),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Categories",style: AppWidget.healinetextstyle(25.0),),
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black45, width: 2.0)
                            ),
                            child: Image.asset("images/plastic.png", height: 100,width: 100, fit: BoxFit.cover,)),
                        SizedBox(height: 5,),
                        Text("Plastic", style: AppWidget.normaltextstyle(20),)
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black45, width: 2.0)
                            ),
                            child: Image.asset("images/paper.png", height: 100,width: 100, fit: BoxFit.cover,)),
                        SizedBox(height: 5,),
                        Text("Paper", style: AppWidget.normaltextstyle(20),)
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black45, width: 2.0)
                            ),
                            child: Image.asset("images/glass.png", height: 100,width: 100, fit: BoxFit.cover,)),
                        SizedBox(height: 5,),
                        Text("Glass", style: AppWidget.normaltextstyle(20),)
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black45, width: 2.0)
                            ),
                            child: Image.asset("images/battery.png", height: 100,width: 100, fit: BoxFit.cover,)),
                        SizedBox(height: 5,),
                        Text("Battery", style: AppWidget.normaltextstyle(20),)
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black45, width: 2.0)
                            ),
                            child: Image.asset("images/metal.png", height: 100,width: 100, fit: BoxFit.cover,)),
                        SizedBox(height: 5,),
                        Text("Metal", style: AppWidget.normaltextstyle(20),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Pending Request", style: AppWidget.healinetextstyle(25.0),),
              ),
              SizedBox(height: 15.0,),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black45, width: 2.0), borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.green,size: 30.0,),
                      SizedBox(height: 10.0,),
                      Text("Main market, Dhaka", style: AppWidget.normaltextstyle(15.0),)
                    ],),
                  Divider(),
                  Image.asset("images/chips.png", height: 100, width: 100, fit: BoxFit.cover,),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.layers, color: Colors.green,size: 30.0,),
                      SizedBox(width: 10.0,),
                      Text("5",style: AppWidget.normaltextstyle(20),)
                    ],
                  )
                ],),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

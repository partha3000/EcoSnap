import 'package:flutter/material.dart';
import 'auth.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Auth")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                var user = await _auth.signIn(
                  emailController.text,
                  passwordController.text,
                );
                setState(() {
                  message = user != null ? "Login Success" : "Login Failed";
                });
              },
              child: Text("Login"),
            ),

            ElevatedButton(
              onPressed: () async {
                var user = await _auth.signUp(
                  emailController.text,
                  passwordController.text,
                );
                setState(() {
                  message = user != null ? "Signup Success" : "Signup Failed";
                });
              },
              child: Text("Register"),
            ),

            SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}
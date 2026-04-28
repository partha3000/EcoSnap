import 'package:ecosnap/services/database.dart';
import 'package:ecosnap/services/shared_perf.dart';
import 'package:flutter/material.dart';
import '../services/widget_support.dart';
import 'login.dart'; // 👉 make sure this exists

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? id, name, email, image;

  // Load user data
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  loadUserData() async {
    id = await SharedpreferenceHelper().getUserId();
    name = await SharedpreferenceHelper().getUserName();
    email = await SharedpreferenceHelper().getUserEmail();
    image = await SharedpreferenceHelper().getUserImage();
    setState(() {});
  }

  // LOGOUT FUNCTION
  logout() async {
    await DatabaseMethods().SignOut();
    await SharedpreferenceHelper().clearUserData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogIn()),
    );
  }

  // DELETE ACCOUNT DIALOG
  void showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Account"),
        content: Text("Are you sure you want to delete your account?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              try {
                await DatabaseMethods().deleteuser();
                await SharedpreferenceHelper().clearUserData();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Re-login required to delete account")),
                );
              }
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return name == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Profile Page",
                style: AppWidget.healinetextstyle(28.0),
              ),
            ),
            SizedBox(height: 20.0),

            Expanded(
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 233, 249),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),

                    // PROFILE IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        image ??
                            "https://via.placeholder.com/150",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 20.0),

                    // NAME
                    profileTile(
                        Icons.person, "Name", name ?? "User"),

                    SizedBox(height: 20.0),

                    // EMAIL
                    profileTile(Icons.mail, "Email",
                        email ?? "No Email"),

                    SizedBox(height: 30.0),

                    // LOGOUT BUTTON
                    GestureDetector(
                      onTap: logout,
                      child: actionTile(
                          Icons.logout, "LogOut", Colors.black),
                    ),

                    SizedBox(height: 20),

                    // DELETE BUTTON
                    GestureDetector(
                      onTap: showDeleteDialog,
                      child: actionTile(
                          Icons.delete,
                          "Delete Account",
                          Colors.red),
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

  // ✅ Reusable Profile Tile
  Widget profileTile(IconData icon, String title, String value) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xff4da9ba), size: 35.0),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
                Text(value,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Reusable Action Tile
  Widget actionTile(
      IconData icon, String text, Color textColor) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: textColor, size: 35.0),
            SizedBox(width: 15.0),
            Text(text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ],
        ),
      ),
    );
  }
}
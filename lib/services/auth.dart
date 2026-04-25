import 'package:ecosnap/pages/home.dart';
import 'package:ecosnap/services/database.dart';
import 'package:ecosnap/services/shared_perf.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  signInWithGoogle(BuildContext context)async{
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
    await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.idToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetails = result.user;

    await SharedpreferenceHelper().saveUserEmail(userDetails!.email!);
    await SharedpreferenceHelper().saveUserId(userDetails.uid);
    await SharedpreferenceHelper().saveUserName(userDetails.displayName!);
    await SharedpreferenceHelper().saveUserImage(userDetails.photoURL!);

    if (result != null) {
      Map<String, dynamic> userinfoMap = {
        "email":userDetails!.email,
        "name":userDetails.displayName,
        "image": userDetails.photoURL,
        "id": userDetails.uid,
      };
     await DatabaseMethods(). addUserInfo(userinfoMap, userDetails.uid);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
  }
}

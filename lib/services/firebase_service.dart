import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_s_flutter/screens/home_screen.dart';
import 'package:firebase_s_flutter/screens/profiles/profile_page.dart';
import 'package:firebase_s_flutter/screens/signup_screen.dart';
import 'package:firebase_s_flutter/services/strings.dart';
import 'package:flutter/material.dart';

class FirebaseService {
///////Function Of Delete Account from Firebase
  static Future<void> deleteUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    try {} catch (e) {}
  }

  ///Fuction of Signup
  static void signUpAuth(String name, String email, String password,
      String phone, BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        //phone,phone,
      );

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            email: email,
          ),
        ),
        (route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(Strings.statement_signup_s)));

      await saveUserData(name, email, phone, password);
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(Strings.statement_signup_error)),
      );
    }
    // saveUserData();
  }

  //Function Of Login
  static Future<void> loginAuth(
      String email, String password, BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ProfilePage()));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            email: email,
          ),
        ),
        (route) => false,
      );
      print("Login Done");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(Strings.statement_ch_data_user_found)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(e.toString())),
      );
    }
  }

  ///Function Of SaveData
  static Future<void> saveUserData(
      String name, String email, String phone, String password) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          // .doc(FirebaseAuth.instance.currentUser!.uid)
          .doc(email)
          .set({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      });
      print("User data has seaved");
    } catch (e) {
      print("error string user data${e.toString()}");
    }
  }

  //Fucntion of Get data User Map
  static Future<Map<String, dynamic>?> getUserData(
    String email,
    // BuildContext context
  ) async {
    try {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('Users').doc(email).get();
      if (userData.exists) {
        return userData.data() as Map<String, dynamic>;
      } else {
        print("User Data No Exists");
      }
    } catch (e) {
      print("Error ");
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(backgroundColor: Colors.red, content: Text(e.toString())));
    }
  }

  ///Function Of Logout
  static Future<void> logout(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(Strings.statement_login_s),
        backgroundColor: Color.fromARGB(255, 4, 109, 109),
      ));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(Strings.statement_login_error),
          backgroundColor: Colors.red));
    }
  }
}

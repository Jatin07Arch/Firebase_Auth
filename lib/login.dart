import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_services/auth_service.dart';
import 'package:flutter_firebase/homepage.dart';
import 'package:flutter_firebase/signup_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loginPageState();
  }
}

class loginPageState extends State<loginPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseService _auth = FirebaseService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/j1.jpg"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 100, top: 20),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 100, top: 90),
                child: Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 70),
                child: Container(
                  margin: EdgeInsets.only(left: 200, right: 200),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      filled: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Container(
                  margin: EdgeInsets.only(left: 200, right: 200),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      fillColor: Colors.black12,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      filled: true,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 200, right: 200),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      User? user = await _auth.SignInMethod(email, password);

                      if (user != null) {
                        print("User successfully Login....!!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Please Use valid credential")),
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 200, right: 200),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      final GoogleSignIn g_signIn = GoogleSignIn();

                      try {
                        final GoogleSignInAccount? g_signIn_account =
                            await g_signIn.signIn();

                        if (g_signIn_account != null) {
                          final GoogleSignInAuthentication g_signIn_auth =
                              await g_signIn_account.authentication;

                          final AuthCredential credential =
                              GoogleAuthProvider.credential(
                            idToken: g_signIn_auth.idToken,
                            accessToken: g_signIn_auth.accessToken,
                          );

                          await _firebaseAuth.signInWithCredential(credential);
                        }
                      } catch (e) {}
                    },
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.google),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Google_Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don' have an account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()),
                            );
                          },
                          child: Text(
                            "SignUp...!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

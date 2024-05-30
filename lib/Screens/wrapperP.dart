import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:untitled5/homepage.dart';
// import 'package:untitled5/login.dart';
// import 'package:untitled5/verifyemail.dart';

import 'home_screen.dart';
import 'logingscreensp.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return HomeScreen();
          }
          else{
            return Login();
          }
        },
      ),
    );
  }
}
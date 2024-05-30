import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'SignupP.dart';
// import 'package:get/get.dart';
// import 'package:untitled5/forgot.dart';
// import 'package:untitled5/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(hintText: 'Enter Email', focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent,
                            width: 3
                        )
                    )),
                  ),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(hintText: 'Enter Password', focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent,
                            width: 3
                        )
                    )),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(onPressed: (()=>signIn()), child: Text("Login")),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (()=>Get.to(Signup())), child: Text("Register Now")),
                  SizedBox(height: 30,),
                  // ElevatedButton(onPressed: (()=>Get.to(Forgot())), child: Text("Forgot Password ?")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
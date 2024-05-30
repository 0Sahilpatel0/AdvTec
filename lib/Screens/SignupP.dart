import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get.dart';
import 'package:homies/Screens/wrapperP.dart';
// import 'package:untitled5/wrapper.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  signup() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(Wrapper());
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('SignUp'),),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                  ),ElevatedButton(onPressed: (()=>signup()), child: Text("Sign Up"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
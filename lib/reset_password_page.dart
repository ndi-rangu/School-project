// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  //controllers
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your Email'),
         );
       },
       );
  } on FirebaseAuthException catch (e) {
    //PRINTING ERROR SHOWN IN THE DATABASE TO THE APPLICATION**
    print(e);
    showDialog(context: context,
     builder:(context) {
      return AlertDialog(
        content: Text(e.message.toString()),
      );
     });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Enter your registered Email and a reset link will be sent', textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),

         // email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[265],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadiusDirectional.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),

              MaterialButton(
                onPressed: passwordReset,
                child: Text('Reset Password'),
                color: Colors.lightBlueAccent,),
              
    ]),
    );
  }
}
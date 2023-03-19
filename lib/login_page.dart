// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bakaki_matatu_app/reset_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key,required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim(),);
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             
              //Intro for the company name
              Text(
              'BAKAKI MATATU SACCO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                ),
              ),
              SizedBox(height: 10),
              Text(
              'Best matatu sacco in Banana',
              style: TextStyle(
                fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
          
          
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
              SizedBox(height: 20),
          
          
          
              //password textfield
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ), 
              SizedBox(height: 20),

              //password reset button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [                 
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ForgotPasswordPage();
                        },
                        ),
                        );
                      },
                      child: Text(' Reset Password', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),

               SizedBox(height: 20),
          
          
              // signin button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.redAccent,
                    borderRadius: BorderRadiusDirectional.circular(12),),
                      child: Center(
                        child: Text('SIGN IN',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                ),
                ),
                SizedBox(height: 30),
          
          
              //registeration button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?', style: TextStyle(fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(' Sign up', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                ],
              ),
          
          
            ],),
          ),
        ),
      ),
    );
  }
}
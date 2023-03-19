// ignore_for_file: prefer_const_constructors, unused_import, unused_field, non_constant_identifier_names, empty_statements

import 'package:bakaki_matatu_app/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controllers
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _idnumberController = TextEditingController();
  final _contactnumberController = TextEditingController();

  Future CreateAccount() async{
    //create user
    if (passwordConfirmed()) {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
       );
       
       

     //adding user details
     addUserDetails(
      _firstnameController.text.trim(), 
      _lastnameController.text.trim(), 
    int.parse(_idnumberController.text.trim()),
      int.parse(_contactnumberController.text.trim()),
     );
     
     


  };
  
  }

  Future addUserDetails(String firstname, String lastname, int idnumber, int Contactnumber) async {
    await FirebaseFirestore.instance.collection('Users').add({
      'first name': firstname,
      'last name': lastname,
      'ID number': idnumber,
      'Contact details': Contactnumber,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  
  }


  @override
  void dispose(){
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _idnumberController.dispose();
    _contactnumberController.dispose();
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
              'Fill in the details required',
              style: TextStyle(
                fontSize: 20,
                ),
              ),
              SizedBox(height: 50),


              // first name textfield
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
                      controller: _firstnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),


              // lastname textfield
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
                      controller: _lastnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Last name',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
          
          
          
          
              // IDnumber textfield
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
                      controller: _idnumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ID',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),


              // Contactnumber textfield
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
                      controller: _contactnumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone number',
                      ),
                    ),
                  ),
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


              //confirmpassword textfield
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
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
              ), 
              SizedBox(height: 20),
          
          
              // Create Account button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: CreateAccount,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.redAccent,
                    borderRadius: BorderRadiusDirectional.circular(12),),
                      child: Center(
                        child: Text('CREATE ACCOUNT',
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
                  Text('Already have an account?', style: TextStyle(fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(' Login up', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                ],
              ),
          
          
          
          
            ],),
          ),
        ),
      ),
    );
  }
}
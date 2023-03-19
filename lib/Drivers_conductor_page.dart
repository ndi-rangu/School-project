// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DriversConductorPage extends StatefulWidget {
  const DriversConductorPage({super.key});

  @override
  State<DriversConductorPage> createState() => _DriversConductorPageState();
}

class _DriversConductorPageState extends State<DriversConductorPage> {
  final User = FirebaseAuth.instance.currentUser!;

  final _mondayController= TextEditingController();
  final _tuesdayController= TextEditingController();
  final _wednesdayController= TextEditingController();
  final _thursdayController= TextEditingController();
  final _fridayController= TextEditingController();
  final _saturdayController= TextEditingController();
  final _sundayController= TextEditingController();

  @override
  void dispose(){
    _mondayController.dispose();
    _tuesdayController.dispose();
    _wednesdayController.dispose();
    _thursdayController.dispose();
    _fridayController.dispose();
   _saturdayController.dispose();
    _sundayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
       appBar: AppBar(
        title: Text( 
          User.email!,style: TextStyle(fontSize: 16),),
          actions: [
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                },
              child: Icon(Icons.logout)),
          ],          
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _mondayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Monday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),)
          ]
          ),
      ),
      SizedBox(height: 20),   
      
          
          //tuesday fare
           Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _tuesdayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Tuesday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),),
          
          ],
          ),
          ),
          SizedBox(height: 20),

          //wednesdays fare
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _wednesdayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Wednesday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),),
          
          ],
          ),
          ),
          SizedBox(height: 20),

          //thursday fare
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _thursdayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Thursday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),),
          
          ],
          ),
          ),
          SizedBox(height: 20),

          //friday fare
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _fridayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Friday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),),
          
          ],
          ),
          ),
          SizedBox(height: 20),

          //saturdays fare
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _saturdayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Saturday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),),
          
          ],
          ),
          ),
          SizedBox(height: 20),


          //sundays fare
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _sundayController,
              decoration: InputDecoration(              
                hintText:'Enter fare amount collected for Sunday',
                border: OutlineInputBorder()),
            ),
            MaterialButton(onPressed: () {},
            color: Colors.blue,
            child: const Text('Submit',style: TextStyle(color: Colors.white)),),
          
          ],
          ),
          ),

         
          ],
          ),
        ),
      ),
    ),
    );
  }
}
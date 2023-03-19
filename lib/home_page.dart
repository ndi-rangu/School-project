// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'Drivers_conductor_page.dart';
import 'HR_page.dart';
import 'Treasurer_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User = FirebaseAuth.instance.currentUser!;

  // navigating buttons to their respective workpage
  Future navigateToDriverConductorPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => DriversConductorPage()));  
  }

  Future navigateToTreasurerPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => TreasurerPage()));
  }

  Future navigateToHrPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HrPage()));
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

                // Drivers and Conductors button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: (){
                    navigateToDriverConductorPage(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Color.fromARGB(255, 48, 48, 48),
                    borderRadius: BorderRadiusDirectional.circular(12),),
                      child: Center(
                        child: Text('DRIVERS AND CONDUCTORS',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                ),
                ),
                SizedBox(height: 30),

                 // Treasurer button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: (){
                    navigateToTreasurerPage(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color:Color.fromARGB(255, 48, 48, 48),
                    borderRadius: BorderRadiusDirectional.circular(12),),
                      child: Center(
                        child: Text('TREASURER',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                ),
                ),
                SizedBox(height: 30),

                 // Human Resource button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: (){
                    navigateToHrPage(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Color.fromARGB(255, 48, 48, 48),
                    borderRadius: BorderRadiusDirectional.circular(12),),
                      child: Center(
                        child: Text('HUMAN RESOURCE MANAGER',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                      ),
                    ),
                ),
                ),
                SizedBox(height: 30),

    ],),
          ),
        ),
      ),
    );
  }
}
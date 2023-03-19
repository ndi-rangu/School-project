// ignore_for_file: unused_import, avoid_function_literals_in_foreach_calls, avoid_print, prefer_const_constructors

import 'package:bakaki_matatu_app/get_users_accounts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_vehicle_page.dart';

class HrPage extends StatefulWidget {
  const HrPage({super.key});

  @override
  State<HrPage> createState() => _HrPageState();
}

class _HrPageState extends State<HrPage> {
  final User = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  //getting docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('Users').get().then((snapshot) => 
    snapshot.docs.forEach((document) {
      print(document.reference);
      docIDs.add(document.reference.id);
     }
     ),
     );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text( 
          User.email!,style: TextStyle(fontSize: 16),),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },),            
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VehiclePage()),);
            },
            icon: const Icon(Icons.car_repair),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocID(),
                builder: (context, snapshot) {
                return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:55.0),
                    child: ListTile(
                      tileColor: Colors.brown,
                              title: GetUserAccount(
                                documentId: docIDs[index]),
                      ),
                  );
                  },
               );
              },
            ),
          ),
        ],
      ),
    ),
    );
  }
}
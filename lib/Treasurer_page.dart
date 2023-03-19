// ignore_for_file: unused_import

import 'package:bakaki_matatu_app/get_fare_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TreasurerPage extends StatefulWidget {
  const TreasurerPage({super.key});

  @override
  State<TreasurerPage> createState() => _TreasurerPageState();
}

class _TreasurerPageState extends State<TreasurerPage> {
  final User = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  //getting docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('Fares').get().then((snapshot) => 
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
          actions: [
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                },
              child: Icon(Icons.logout)),
          ],
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
                      tileColor: Colors.pink,
                              title: GetFareCollected(
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